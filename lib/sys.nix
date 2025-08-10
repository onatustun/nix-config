inputs: self: super: let
  inherit (super) nixosSystem darwinSystem makeSystemConfig nixOnDroidConfiguration;
  inherit (super) genAttrs filter strings flatten splitString mkDefault optional optionals;
  inherit (self) collectNix;
  inherit (builtins) elem head elemAt;
  inherit (strings) hasInfix;

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
  };

  mkSystem = type: {
    hostName,
    system ? systems.${type}.platform,
    username ? "onat",
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
    };

    packageOverlay = final: prev:
      genAttrs packages (name:
        final.callPackage (inputs.self + /pkgs/${name}.nix) {});

    filterIgnored = files:
      filter (file:
        !(elem (baseNameOf (toString file)) (map (name: "${name}.nix") ignore)))
      files;

    processModules = modules:
      flatten (map (module:
        if hasInfix "/" module
        then let
          parts = splitString "/" module;
        in
          inputs.self + /modules/${head parts}/${elemAt parts 1}.nix
        else
          collectNix (inputs.self + /modules/${module})
          |> filterIgnored)
      modules);

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
              programs.home-manager.enable = true;
              home.sessionVariables.FLAKE = "${homeDir}/nix";
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
        ++ extraModules;
    };
in {
  mkNixos = mkSystem "nixos";
  mkDarwin = mkSystem "darwin";
  mkLinux = mkSystem "linux";
  mkDroid = mkSystem "droid";
}
