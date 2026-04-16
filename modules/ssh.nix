{
  flake.modules.nixos.ssh = {
    services.openssh = {
      enable = true;
      settings.KbdInteractiveAuthentication = false;
    };

    programs.ssh.startAgent = false;
  };
}
