{
  flake.modules.nixos.keyring = {pkgs, ...}: {
    security.pam.services = {
      gdm-password.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };

    services = {
      gnome.gnome-keyring.enable = true;
      dbus.packages = [pkgs.gnome-keyring];
    };

    programs.seahorse.enable = true;
  };
}
