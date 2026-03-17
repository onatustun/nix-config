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
      }: {
        "${type}Configurations".${hostName} = withSystem system ({
          inputs',
          self',
          config,
          ...
        }:
          inputs.${systems.${type}.input}.lib."${type}System" {
            specialArgs =
              inputs
              // {
                inherit (config) apps checks devShells formatter legacyPackages packages;
                inherit inputs self inputs' self' type hostName system username homeVersion hmModules;

                isDesktop = hostName == "desktop";
                isLaptop = hostName == "laptop";
                isServer = hostName == "server";

                homeDir = "/${systems.${type}.homePrefix}/${username}";
                secretsDir = self + "/secrets";
                keys = import ./_keys.nix;
              };

            modules = [self.modules.${type}."host-${hostName}"];
          });

        modules.${type}."host-${hostName}" = {
          system = {inherit stateVersion;};

          imports =
            modules
            ++ lib.lists.optional (homeVersion != null) self.modules.${type}.home-manager
            ++ [module];
        };
      };
  };
}
