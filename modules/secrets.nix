{ inputs, moduleWithSystem, ... }:
{
  partitions.dev.module.perSystem =
    { inputs', ... }:
    {
      make-shells.default = {
        shellHook = ''
          export RULES="$(git rev-parse --show-toplevel)/secrets.nix"
        '';

        packages = [ inputs'.ragenix.packages.default ];
      };
    };

  flake =
    { config, ... }:
    {
      inherit (inputs) keys;

      modules = {
        nixos = {
          core = {
            _module.args.keys = import inputs.keys;
          };

          ragenix = {
            imports = [ inputs.ragenix.nixosModules.default ];
            age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
            home-manager.sharedModules = [ config.modules.homeManager.ragenix ];
          };
        };

        homeManager.ragenix = moduleWithSystem (
          { inputs', ... }:
          { config, pkgs, ... }:
          {
            imports = [ inputs.ragenix.homeManagerModules.default ];
            age.identityPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];

            home.packages = [
              inputs'.ragenix.packages.default
              pkgs.rage
            ];
          }
        );
      };
    };
}
