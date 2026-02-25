{
  lib,
  inputs,
  self,
  withSystem,
  ...
}: {
  options.mk-os = lib.options.mkOption {
    type = lib.types.unspecified;

    default = type: hostName: let
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
    in
      {
        system ? systems.${type}.platform,
        username ? "onat",
        stateVersion ? null,
        homeVersion ? null,
        modules ? [],
        hmModules ? [],
        module ? {},
      }: let
        specialArgs =
          inputs
          // {
            inherit inputs system type hostName username homeVersion hmModules;

            isDesktop = hostName == "desktop";
            isLaptop = hostName == "laptop";
            isServer = hostName == "server";

            homeDir = "/${systems.${type}.homePrefix}/${username}";
            secretsDir = self + "/secrets";
            keys = import ./_keys.nix;
          };

        perSystemArgs = {
          _module.args = withSystem system ({
            self',
            inputs',
            ...
          }: {inherit self' inputs';});
        };

        os = inputs.${systems.${type}.input}.lib."${type}System" {
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
  };
}
