{
  networking.networkmanager.enable = true;

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
