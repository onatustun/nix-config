{
  inputs,
  self,
  ...
}: {
  flake.deploy.nodes.desktop = {
    hostname = "desktop";

    profiles.system = {
      user = "root";
      sshUser = "root";

      path =
        inputs.deploy-rs.lib.x86_64-linux.activate.nixos
        self.nixosConfigurations.desktop;
    };
  };
}
