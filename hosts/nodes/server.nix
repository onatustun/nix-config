{inputs, ...}: {
  flake.deploy.nodes.server = {
    hostname = "23.88.34.248";

    profiles.system = {
      user = "root";
      sshUser = "root";

      path =
        inputs.deploy-rs.lib.x86_64-linux.activate.nixos
        inputs.self.nixosConfigurations.server;
    };
  };
}
