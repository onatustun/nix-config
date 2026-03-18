{
  flake.modules.nixos = {
    network = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.ssh;
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
