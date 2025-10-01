super: inputs: self: let
  inherit (super) attrValues filter hasAttrByPath getAttrFromPath const genAttrs flip unique optional mkDefault optionals mapAttrs;
  inherit (self) collectNix;
  inherit (super) nixosSystem darwinSystem;
  inherit (builtins) readDir;

  collectInputs = path:
    inputs
    |> attrValues
    |> filter (hasAttrByPath path)
    |> map (getAttrFromPath path);

  systems = {
    nixos = {
      platform = "x86_64-linux";
      builder = nixosSystem;
      homeDir = username: "/home/${username}";
      osModules = collectNix (inputs.self + "/modules/nixos");
      osInputModules = collectInputs ["nixosModules" "default"];
    };

    darwin = {
      platform = "aarch64-darwin";
      builder = darwinSystem;
      homeDir = username: "/Users/${username}";
      osModules = collectNix (inputs.self + "/modules/darwin");
      osInputModules = collectInputs ["darwinModules" "default"];
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
    cfg = systems.${type};
    homeDir = cfg.homeDir username;

    hostTypes = {
      isDesktop = hostName == "desktop";
      isLaptop = hostName == "laptop";
      isServer = hostName == "server";
      isWsl = hostName == "wsl";

      isNixos = type == "nixos";
      isDarwin = type == "darwin";
    };

    secretsDir = "${inputs.self}/secrets";

    specialArgs =
      inputs
      // hostTypes
      // {
        inherit inputs system hostName username homeDir secretsDir;
        lib = self;
      };

    allowAllUnfree = {
      allowUnfree = true;
      allowBroken = true;

      allowUnfreePredicate =
        const
        <| true;
    };

    inputOverlays = collectInputs ["overlays" "default"];

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

    inputHomeModules = collectInputs ["homeModules" "default"];

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
  in
    cfg.builder {
      inherit specialArgs system;

      modules =
        baseModules
        ++ [module]
        ++ homeManagerModule
        ++ cfg.osInputModules
        ++ commonModules
        ++ cfg.osModules
        ++ inputModules;
    };
in {
  mkHostSet = dir:
    readDir dir
    |> mapAttrs (name:
      const
      <| (dir
        + "/${name}"
        |> (path:
          import path inputs)
        |> buildSystem (baseNameOf dir) name));
}
