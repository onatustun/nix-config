{
  flake.nixosModules.ssh = {
    services.openssh = {
      enable = true;
      settings.KbdInteractiveAuthentication = false;
    };

    programs.ssh.startAgent = false;
  };
}
