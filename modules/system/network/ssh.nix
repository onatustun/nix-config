{
  flake.modules.nixos.ssh = {
    services.openssh = {
      enable = true;

      settings = {
        AuthenticationMethods = "publickey keyboard-interactive:pam";
        PasswordAuthentication = false;
      };
    };

    programs.ssh.startAgent = false;
  };
}
