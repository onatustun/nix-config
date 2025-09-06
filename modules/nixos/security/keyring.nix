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
    gnome = {
      gcr-ssh-agent = enabled;
      gnome-keyring = enabled;
    };

    dbus.packages = with pkgs; [
      gcr
      gnome-keyring
    ];
  };

  programs.seahorse = enabled;
}
