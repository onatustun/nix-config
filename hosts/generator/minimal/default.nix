{username, ...}: {
  users = {
    mutableUsers = false;

    users.${username}.extraGroups = [
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

  networking.hostName = "minimal";
  security.sudo.enable = false;
  system.nixos.variant_id = "installer";
}
