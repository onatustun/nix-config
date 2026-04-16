{
  flake.modules.nixos.keyring = {
    security.pam.services.gdm-password.enableGnomeKeyring = true;
    programs.seahorse.enable = true;
  };
}
