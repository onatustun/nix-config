{
  flake.nixosModules.ssh = {
    services.openssh = {
      enable = true;

      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
      };
    };

    programs.ssh.startAgent = false;
  };
}
