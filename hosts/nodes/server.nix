{inputs, ...}: {
  server = {
    hostname = "server";

    profiles.system = {
      user = "root";
      sshUser = "root";

      path =
        inputs.deploy-rs.lib.x86_64-linux.activate.nixos
        inputs.self.nixosConfigurations.server;
    };
  };
}
