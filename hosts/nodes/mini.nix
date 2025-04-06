{inputs, ...}: {
  mini = {
    hostname = "mini";

    profiles.system = {
      user = "root";
      sshUser = "root";

      path =
        inputs.deploy-rs.lib.x86_64-darwin.activate.darwin
        inputs.self.darwinConfigurations.mini;
    };
  };
}
