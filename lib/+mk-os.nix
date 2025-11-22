{
  self,
  lib,
  inputs,
  withSystem,
  ...
}: let
  systems = {
    nixos = {
      platform = "x86_64-linux";
      input = "nixpkgs";
      homePrefix = "home";
    };

    darwin = {
      platform = "aarch64-darwin";
      input = "nix-darwin";
      homePrefix = "Users";
    };
  };

  mk-os = type: hostName: {
    system ? systems.${type}.platform,
    username ? "onat",
    stateVersion ? null,
    homeVersion ? null,
    packages ? [],
    overlays ? [],
    modules ? [],
    hmModules ? [],
    module ? {},
  }: let
    hostPredicates = {
      isDarwin = type == "darwin";
      isNixos = type == "nixos";
      isDesktop = hostName == "desktop";
      isLaptop = hostName == "laptop";
      isMini = hostName == "mini";
      isServer = hostName == "server";
      isWsl = hostName == "wsl";
      isOnat = username == "onat";
    };

    packageOverlay = final:
      lib.trivial.const (lib.attrsets.genAttrs packages (name:
          final.callPackage (self + "/pkgs/${name}.nix") {}));

    overlays' =
      overlays
      ++ lib.lists.optional (packages != []) packageOverlay;

    cfg = systems.${type};
    homeDir = "/${cfg.homePrefix}/${username}";
    secretsDir = self + "/secrets";
    keys = import ./_keys.nix;

    specialArgs =
      inputs
      // hostPredicates
      // {inherit inputs system type hostName username overlays' homeVersion hmModules homeDir secretsDir keys;};

    perSystemArgs = {
      _module.args = withSystem system ({
        self',
        inputs',
        ...
      }: {inherit self' inputs';});
    };

    os = inputs.${cfg.input}.lib."${type}System" {
      inherit specialArgs;
      modules = [self.modules.${type}."host-${hostName}"];
    };

    osConfig = os.config;
  in {
    "${type}Configurations".${hostName} = os;

    modules.${type}."host-${hostName}" = {
      system = {inherit stateVersion;};

      imports =
        [perSystemArgs]
        ++ modules
        ++ lib.lists.optional (homeVersion != null) self.modules.${type}.home-manager
        ++ [module];
    };

    homeConfigurations = lib.modules.mkIf (homeVersion != null) {
      "${username}@${hostName}" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          hostPlatform = {inherit system;};
          inherit (osConfig.nixpkgs) config overlays;
        };

        extraSpecialArgs =
          specialArgs
          // {
            inherit osConfig;
            isStandalone = true;
          };

        modules =
          [
            perSystemArgs
            self.modules.homeManager.home-manager
          ]
          ++ hmModules
          ++ osConfig.home-manager.sharedModules;
      };
    };
  };
in {
  options.mk-os = lib.options.mkOption {
    type = lib.types.unspecified;
    default = mk-os;
  };
}
