{
  lib,
  withSystem,
  inputs,
  self,
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
            inherit inputs self inputs' self' type system hostName username stateVersion homeVersion hmModules;
            keys = import ./_keys.nix;
          };

          modules =
            lib.lists.singleton self.modules.${type}.core
            ++ modules
            ++ lib.lists.optional (homeVersion != null) self.modules.${type}.home-manager;
        });
    };
  };
}
