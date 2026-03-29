{ inputs, self, ... }:
let
  inherit (inputs.deploy-rs.lib.x86_64-linux) activate;
in
{
  flake.deploy.nodes.desktop = {
    hostname = "desktop";

    profiles.system = {
      user = "root";
      sshUser = "root";
      path = activate.nixos self.nixosConfigurations.desktop;
    };
  };
}
