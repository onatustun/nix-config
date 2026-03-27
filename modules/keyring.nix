{
  flake.nixosModules.keyring = {pkgs, ...}: {
    services = {
      gnome.gnome-keyring.enable = true;
      dbus.packages = [pkgs.gnome-keyring];
    };

    security.pam.services = {
      gdm-password.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };

    programs.seahorse.enable = true;
  };
}
