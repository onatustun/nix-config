{
  flake.nixosModules = {
    network = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.ssh;
    };

    ssh = {
      services.openssh = {
        enable = true;

        settings = {
          AuthenticationMethods = "publickey keyboard-interactive:pam";
          PasswordAuthentication = false;
        };
      };

      programs.ssh.startAgent = false;
    };
  };
}
