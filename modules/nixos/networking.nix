{hostName, ...}: {
  networking = {
    networkmanager.enable = true;
    hostName = hostName;
  };
}
