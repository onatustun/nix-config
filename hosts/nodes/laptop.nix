{
  lib,
  inputs,
  ...
}: {
  laptop = {
    hostname = "laptop";

    profiles.system = {
      user = "root";
      sshUser = "root";

      path =
        lib.x86_64-darwin.activate
        inputs.self.nixosConfigurations.laptop;
    };
  };
}
