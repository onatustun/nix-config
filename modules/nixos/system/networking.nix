{
  lib,
  hostName,
  ...
}: let
  inherit (lib) enabled;
in {
  networking = {
    networkmanager = enabled;
    hostName = hostName;
    firewall.allowedTCPPorts = [57621];
  };
}
