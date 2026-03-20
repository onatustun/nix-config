{
  flake.nixosModules = {
    network = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.ssh;
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
