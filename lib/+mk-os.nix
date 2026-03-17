{
  lib,
  inputs,
  self,
  withSystem,
  ...
}: {
  options.mk-os = lib.options.mkOption {
    type = lib.types.unspecified;

    default = type: {
      system ? throw "no system provided",
      hostName ? throw "no hostName provided",
      username ? throw "no username provided",
      stateVersion ? null,
      homeVersion ? null,
      modules ? [],
      hmModules ? [],
    }: {
      "${type}Configurations".${hostName} = withSystem system ({
        inputs',
        self',
        config,
        ...
      }:
        inputs.${
          if type == "nixos"
          then "nixpkgs"
          else "nix-darwin"
        }.lib."${type}System" {
          specialArgs = {
            inherit (config) apps checks devShells formatter legacyPackages packages;
            inherit inputs self inputs' self' type system hostName username homeVersion hmModules;

            isDesktop = hostName == "desktop";
            isLaptop = hostName == "laptop";
            isServer = hostName == "server";

            homeDir = "/${
              if lib.strings.hasSuffix "darwin" system
              then "Users"
              else "home"
            }/${username}";

            secretsDir = self + "/secrets";
            keys = import ./_keys.nix;
          };

          modules = [self.modules.${type}."host-${hostName}"];
        });

      modules.${type}."host-${hostName}" = {
        system = {inherit stateVersion;};

        imports =
          modules
          ++ lib.lists.optional (homeVersion != null) self.modules.${type}.home-manager;
      };
    };
  };
}
