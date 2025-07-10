{hostName, ...}: {
  networking = {
    networkmanager.enable = true;
    hostName = hostName;
    firewall.allowedTCPPorts = [57621];
  };
}
