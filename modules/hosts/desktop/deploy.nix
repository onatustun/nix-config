{ inputs, ... }:
let
  inherit (inputs.deploy-rs.lib.x86_64-linux) activate;
in
{
  flake =
    { config, ... }:
    {
      deploy.nodes.desktop = {
        hostname = "desktop";

        profiles.system = {
          user = "root";
          sshUser = "root";
          path = activate.nixos config.nixosConfigurations.desktop;
        };
      };
    };
}
