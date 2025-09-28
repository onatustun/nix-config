super: inputs: self: let
  inherit (super) nixosSystem darwinSystem;
  inherit (super) genAttrs removePrefix filesystem hasSuffix removeSuffix splitString elemAt length hasPrefix hasInfix filter any pathExists flatten unique mkDefault optional optionals;
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
    inputModules ? [],
    overlays ? [],
    modules ? [],
    ignore ? [],
    extraModules ? [],
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

    packageOverlay = final: _:
      genAttrs packages (name:
        final.callPackage (inputs.self + /pkgs/${name}.nix) {});

    secretsDir = "${inputs.self}/secrets";
    modulesRoot = "${inputs.self}/modules";

    relPath = file:
      toString file
      |> removePrefix "${modulesRoot}/";

    normalizeSpec = s:
      if hasSuffix "/" s
      then removeSuffix "/" s
      else s;

    mkIgnorePredicate = spec: let
      s =
        toString spec
        |> normalizeSpec;
    in
      if hasSuffix ".nix" s
      then let
        parts = splitString "/" s;
        fname = elemAt parts (length parts - 1);

        dirPrefix =
          if length parts > 1
          then removeSuffix "/${fname}" s
          else null;
      in
        file:
          baseNameOf file == fname && (dirPrefix == null || hasPrefix (dirPrefix + "/") (relPath file))
      else let
        hasSlash = hasInfix "/" s;
      in
        file: let
          rp = relPath file;
        in
          if hasSlash
          then hasPrefix (s + "/") rp
          else hasPrefix (s + "/") rp || hasInfix ("/" + s + "/") rp;

    filterIgnored = files:
      ignore
      |> map mkIgnorePredicate
      |> (preds:
        files
        |> filter (file:
          !(any (p:
            p file)
          preds)));

    resolveModuleSpec = spec: let
      s =
        toString spec
        |> normalizeSpec;
      p = "${modulesRoot}/${s}";
    in
      if hasSuffix ".nix" s
      then
        if pathExists p
        then [p]
        else throw "Module file not found: ${s}"
      else if pathExists p
      then
        listFilesRecursive p
        |> filter (hasSuffix ".nix")
      else throw "Module directory not found: ${s}";

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
        inherit inputs system type systemBuilder hostName username homeDir homeVer secretsDir;
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

      "${inputs.self}/hosts/${type}/${hostName}"
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
        baseModules
        ++ homeManagerModule
        ++ inputModules
        ++ processModules modules
        ++ extraModules;
    };
in {
  nixosSystem' = mkSystem "nixos";
  darwinSystem' = mkSystem "darwin";
}
