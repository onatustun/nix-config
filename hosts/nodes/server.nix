{
  lib,
  inputs,
  ...
}: {
  server = {
    hostname = "server";

    profiles.system = {
      user = "root";
      sshUser = "root";

      path =
        lib.x86_64-darwin.activate
        inputs.self.nixosConfigurations.server;
    };
  };
}
