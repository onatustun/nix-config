{
  flake.nixosModules.keyring = {
    lib,
    pkgs,
    ...
  }: {
    services = {
      gnome.gnome-keyring.enable = true;
      dbus.packages = lib.lists.singleton pkgs.gnome-keyring;
    };

    security.pam.services = {
      gdm-password.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };

    programs.seahorse.enable = true;
  };
}
