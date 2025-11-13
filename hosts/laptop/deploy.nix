{
  inputs,
  self,
  ...
}: {
  flake.deploy.nodes.laptop = {
    hostname = "laptop";

    profiles.system = {
      user = "root";
      sshUser = "root";

      path =
        inputs.deploy-rs.lib.x86_64-linux.activate.nixos
        self.nixosConfigurations.laptop;
    };
  };
}
