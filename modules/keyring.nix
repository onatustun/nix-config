{
  flake.nixosModules.keyring = {
    security.pam.services.gdm-password.enableGnomeKeyring = true;
    programs.seahorse.enable = true;
  };
}
