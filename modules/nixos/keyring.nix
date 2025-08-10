{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  services = {
    gnome.gnome-keyring = enabled;
    dbus.packages = [pkgs.gnome-keyring];
  };
}
