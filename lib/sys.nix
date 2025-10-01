super: inputs: self: let
  inherit (super) nixosSystem darwinSystem;
  inherit (super) const flip genAttrs removePrefix filesystem hasSuffix removeSuffix hasPrefix hasInfix filter any flatten unique mkDefault optional optionals;
  inherit (filesystem) listFilesRecursive;

  systems = {
    nixos = {
      platform = "x86_64-linux";
      builder = nixosSystem;
      homeDir = username: "/home/${username}";
    };

    darwin = {
      platform = "aarch64-darwin";
      builder = darwinSystem;
      homeDir = username: "/Users/${username}";
    };
  };

  mkSystem = type: {
    hostName,
    system ? systems.${type}.platform,
    username ? "onat",
    stateVer ? null,
    homeVer ? null,
    packages ? [],
    overlays ? [],
    inputModules ? [],
    modules ? [],
    ignore ? [],
    module,
  }: let
    cfg = systems.${type};
    systemBuilder = cfg.builder;
    homeDir = cfg.homeDir username;

    hostTypes = {
      isDesktop = hostName == "desktop";
      isLaptop = hostName == "laptop";
      isServer = hostName == "server";
      isWsl = hostName == "wsl";

      isNixos = type == "nixos";
      isDarwin = type == "darwin";
    };

    root = inputs.self;
    pkgsDir = "${root}/pkgs";
    modulesRoot = "${root}/modules";
    secretsDir = "${root}/secrets";

    packageOverlay = final:
      const
      <| genAttrs packages (name:
        "${pkgsDir}/${name}.nix"
        |> flip final.callPackage {});

    relPath = file:
      toString file
      |> removePrefix "${modulesRoot}/";

    normalizeSpec = spec:
      if hasSuffix "/" spec
      then removeSuffix "/" spec
      else spec;

    mkIgnorePredicate = spec:
      toString spec
      |> normalizeSpec
      |> (specStr: let
        hasSlash = hasInfix "/" specStr;
        base = baseNameOf specStr;
        prefix = specStr + "/";
        dirPref =
          if hasSlash
          then removeSuffix "/${base}" specStr + "/"
          else null;
      in
        file: let
          rp = relPath file;
          startsWithPrefix = hasPrefix prefix rp;
        in
          if hasSuffix ".nix" specStr
          then baseNameOf file == base && (dirPref == null || hasPrefix dirPref rp)
          else if hasSlash
          then startsWithPrefix
          else startsWithPrefix || hasInfix ("/" + specStr + "/") rp);

    filterIgnored = files:
      ignore
      |> map mkIgnorePredicate
      |> (preds:
        files
        |> filter (file:
          !(any (p:
            p file)
          preds)));

    resolveModuleSpec = spec:
      toString spec
      |> normalizeSpec
      |> (specStr: let
        modulePath = "${modulesRoot}/${specStr}";
      in
        if hasSuffix ".nix" specStr
        then [modulePath]
        else
          listFilesRecursive modulePath
          |> filter (hasSuffix ".nix"));

    processModules = moduleSpecs:
      moduleSpecs
      |> map resolveModuleSpec
      |> flatten
      |> filterIgnored
      |> unique;

    specialArgs =
      inputs
      // hostTypes
      // {
        inherit inputs system type systemBuilder hostName username homeDir homeVer root pkgsDir modulesRoot secretsDir;
        lib = self;
      };

    baseModules = [
      {
        users.users.${username}.home = homeDir;
        system.stateVersion = stateVer;

        nixpkgs = {
          hostPlatform = mkDefault system;

          overlays =
            overlays
            ++ optional (packages != []) packageOverlay;
        };
      }
    ];

    homeManagerModule = optionals (homeVer != null) [
      {
        home-manager = {
          sharedModules = [
            {
              programs.home-manager.enable = true;
              home.sessionVariables.FLAKE = "${homeDir}/nix";

              nixpkgs.config = {
                allowUnfree = true;
                allowBroken = true;
                allowUnfreePredicate = _: true;
              };
            }
          ];

          users.${username}.home = {
            homeDirectory = homeDir;
            stateVersion = homeVer;
          };

          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = specialArgs;
        };
      }
    ];
  in
    cfg.builder {
      inherit specialArgs system;

      modules =
        [module]
        ++ baseModules
        ++ homeManagerModule
        ++ inputModules
        ++ processModules modules;
    };
in {
  nixosSystem' = mkSystem "nixos";
  darwinSystem' = mkSystem "darwin";
}
