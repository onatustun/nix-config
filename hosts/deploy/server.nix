{inputs, ...}: {
  deploy.nodes.server = {
    hostname = "23.88.34.248";

    profiles.system = {
      sshUser = "root";
      user = "root";
      magicRollback = false;

      path =
        inputs.deploy-rs.lib.x86_64-linux.activate.nixos
        inputs.self.nixosConfigurations.server;
    };
  };
}
