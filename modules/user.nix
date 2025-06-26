{
  hostName,
  pkgs,
  inputs,
  ...
}: {
  networking = {
    networkmanager.enable = true;
    hostName = hostName;
  };

  users.users.onat = {
    isNormalUser = true;

    extraGroups = [
      "audio"
      "input"
      "libvirt"
      "networkmanager"
      "power"
      "storage"
      "video"
      "wheel"
    ];
  };
}
