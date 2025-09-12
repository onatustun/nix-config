{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  services.resolved = enabled;

  environment.systemPackages = with pkgs; [
    geteduroam
    geteduroam-cli
    networkmanagerapplet
  ];

  networking = {
    networkmanager = enabled {
      wifi.powersave = false;
      dns = "systemd-resolved";
    };

    firewall.checkReversePath = "loose";
  };
}
