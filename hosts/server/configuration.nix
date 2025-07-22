{username, ...}: {
  users.users = {
    root.openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS o@ust.sh"];

    ${username}.extraGroups = [
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

  boot.loader.grub.efiInstallAsRemovable = true;
  services.openssh.enable = true;
  system.stateVersion = "24.11";
}
