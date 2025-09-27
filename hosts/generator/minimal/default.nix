{username, ...}: {
  networking.networkmanager.enable = true;

  users.users.${username} = {
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

  security.sudo.enable = false;
  system.nixos.variant_id = "installer";
}
