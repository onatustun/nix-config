{
  lib,
  hostName,
  ...
}: let
  inherit (lib) enabled;
in {
  services = {
    network-manager-applet = enabled;
    resolved = enabled;
  };

  networking = {
    inherit hostName;
    networkmanager = enabled {dns = "systemd-resolved";};
    firewall.checkReversePath = "loose";
  };
}
