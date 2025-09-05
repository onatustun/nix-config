{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  security.pam.services = {
    gdm-password.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  services = {
    gnome.gnome-keyring = enabled;

    dbus.packages = with pkgs; [
      gcr
      gnome-keyring
    ];
  };

  programs.seahorse = enabled;
}
