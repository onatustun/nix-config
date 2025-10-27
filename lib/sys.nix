super: inputs: self: let
  inherit (super) nixosSystem darwinSystem mapAttrs attrValues filter hasAttrByPath getAttrFromPath const genAttrs flip unique optional mkDefault optionals concatLists;
  inherit (self) evalFlakeModule collectNix;
  inherit (builtins) readDir;

  systems = {
    nixos = {
      platform = "x86_64-linux";
      builder = nixosSystem;
      homePrefix = "home";
      modulesPath = "/modules/nixos";

      inputModules = [
        "nixosModules"
        "default"
      ];
    };

    darwin = {
      platform = "aarch64-darwin";
      builder = darwinSystem;
      homePrefix = "Users";
      modulesPath = "/modules/darwin";

      inputModules = [
        "darwinModules"
        "default"
      ];
    };
  };

  buildSystem = type: hostName: {
    system ? systems.${type}.platform,
    username ? "onat",
    stateVer ? null,
    homeVer ? null,
    packages ? [],
    overlays ? [],
    inputModules ? [],
    module,
  }: let
    hostTypes = {
      isNixos = type == "nixos";
      isDarwin = type == "darwin";
      isDesktop = hostName == "desktop";
      isLaptop = hostName == "laptop";
      isServer = hostName == "server";
      isWsl = hostName == "wsl";
      isOnat = username == "onat";
    };

    cfg = systems.${type};
    homeDir = "/${cfg.homePrefix}/${username}";
    secretsDir = inputs.self + "/secrets";

    flakeModule = evalFlakeModule {inherit inputs;} {};
    inputs' = mapAttrs (const (flakeModule.config.perInput system)) inputs;

    specialArgs =
      inputs
      // inputs'
      // hostTypes
      // {
        inherit inputs inputs' system hostName username homeDir secretsDir;
        lib = self;
      };

    allowAllUnfree = {
      allowUnfree = true;
      allowBroken = true;
      allowUnfreePredicate = const true;
    };

    collectInputs = path:
      attrValues inputs
      |> filter (hasAttrByPath path)
      |> map (getAttrFromPath path);

    inputOverlays = collectInputs [
      "overlays"
      "default"
    ];

    packageOverlay = final:
      const
      <| genAttrs packages (name:
        "${inputs.self}/pkgs/${name}.nix"
        |> flip final.callPackage {});

    overlays' =
      inputOverlays
      ++ overlays
      ++ optional (packages != []) packageOverlay
      |> unique;

    baseModules = [
      {
        users.users.${username}.home = homeDir;
        system.stateVersion = stateVer;

        nixpkgs = {
          hostPlatform = mkDefault system;
          config = allowAllUnfree;
          overlays = overlays';
        };
      }
    ];

    inputHomeModules = collectInputs [
      "homeModules"
      "default"
    ];

    hmShared =
      inputHomeModules
      ++ [
        {
          programs.home-manager.enable = true;
          home.sessionVariables.FLAKE = "${homeDir}/nix";
          nixpkgs.config = allowAllUnfree;
        }
      ];

    homeManagerModule = optionals (homeVer != null) [
      {
        home-manager = {
          sharedModules = hmShared;

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

    commonModules = collectNix (inputs.self + "/modules/common");
    osModules = collectNix (inputs.self + cfg.modulesPath);
    osInputModules = collectInputs cfg.inputModules;
  in
    cfg.builder {
      inherit specialArgs system;

      modules = concatLists [
        baseModules
        [module]
        homeManagerModule
        osInputModules
        commonModules
        osModules
        inputModules
      ];
    };
in {
  mkHostSet = dir:
    readDir dir
    |> mapAttrs (name:
      dir
      + "/${name}"
      |> (path:
        import path inputs)
      |> buildSystem (baseNameOf dir) name
      |> const);
}
