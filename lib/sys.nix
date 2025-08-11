inputs: self: super: let
  inherit (super) nixosSystem darwinSystem makeSystemConfig nixOnDroidConfiguration;
  inherit (inputs.nixos-generators) nixosGenerate;
  inherit (super) genAttrs filter strings flatten splitString mkDefault optional optionals unique any;
  inherit (self) collectNix enabled;
  inherit (builtins) elemAt baseNameOf toString pathExists length;
  inherit (strings) hasInfix hasSuffix hasPrefix removePrefix removeSuffix;

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

    linux = {
      platform = "x86_64-linux";
      builder = makeSystemConfig;
      homeDir = username: "/home/${username}";
    };

    droid = {
      platform = "aarch64-linux";
      builder = nixOnDroidConfiguration;
      homeDir = username: "/home/${username}";
    };

    generator = {
      platform = "x86_64-linux";
      builder = nixosGenerate;
      homeDir = username: "/home/${username}";
    };
  };

  mkSystem = type: {
    hostName,
    system ? systems.${type}.platform,
    format ? null,
    username ? "onat",
    stateVer ? null,
    homeVer ? null,
    packages ? [],
    overlays ? [],
    inputModules ? [],
    modules ? [],
    ignore ? [],
    extraModules ? [],
  }: let
    cfg = systems.${type} or (throw "Unknown type: ${type}");
    systemBuilder = cfg.builder;
    homeDir = cfg.homeDir username;

    hostTypes = {
      isDesktop = hostName == "desktop";
      isLaptop = hostName == "laptop";
      isServer = hostName == "server";
      isWsl = hostName == "wsl";

      isNixos = type == "nixos";
      isDarwin = type == "darwin";
      isLinux = type == "linux";
      isDroid = type == "droid";
      isGenerate = type == "generate";
    };

    packageOverlay = final: prev:
      genAttrs packages (name:
        final.callPackage (inputs.self + /pkgs/${name}.nix) {});

    modulesRoot = inputs.self + "/modules";

    relPath = file:
      toString file
      |> removePrefix "${toString modulesRoot}/";

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
      p = modulesRoot + "/${s}";
    in
      if hasSuffix ".nix" s
      then
        if pathExists p
        then [p]
        else throw "Module file not found: ${s}"
      else if pathExists p
      then collectNix p
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
        inherit inputs system type systemBuilder hostName username homeDir homeVer;
        lib = self;
      };

    baseModules =
      [
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

        (inputs.self + "/hosts/${type}/${hostName}")
      ]
      ++ processModules modules;

    homeManagerModule = optionals (homeVer != null) [
      {
        home-manager = {
          sharedModules = [
            {
              programs.home-manager = enabled;
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
    cfg.builder (
      (
        if format != null
        then {format = "${format}";}
        else {}
      )
      // {
        inherit specialArgs system;

        modules =
          baseModules
          ++ homeManagerModule
          ++ inputModules
          ++ extraModules;
      }
    );
in {
  nixosSystem' = mkSystem "nixos";
  darwinSystem' = mkSystem "darwin";
  makeSystemConfig' = mkSystem "linux";
  nixOnDroidConfiguration' = mkSystem "droid";
  nixosGenerate' = mkSystem "generator";
}
