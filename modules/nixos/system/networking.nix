{
  lib,
  pkgs,
  hostName,
  ...
}: let
  inherit (lib) enabled;
in {
  services.resolved = enabled;
  environment.systemPackages = [pkgs.networkmanagerapplet];

  networking = {
    inherit hostName;
    networkmanager = enabled {dns = "systemd-resolved";};
    firewall.checkReversePath = "loose";
  };
}
