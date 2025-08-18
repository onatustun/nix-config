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

  security.sudo.enable = false;
  system.nixos.variant_id = "installer";
}
