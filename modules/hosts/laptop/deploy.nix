{ inputs, ... }:
let
  inherit (inputs.deploy-rs.lib.x86_64-linux) activate;
in
{
  flake =
    { config, ... }:
    {
      deploy.nodes.laptop = {
        hostname = "laptop";

        profiles.system = {
          user = "root";
          sshUser = "root";
          path = activate.nixos config.nixosConfigurations.laptop;
        };
      };
    };
}
