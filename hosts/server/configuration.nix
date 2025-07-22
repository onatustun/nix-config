{
  username,
  pkgs,
  ...
}: {
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

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-ffmpeg
    jellyfin-web
  ];

  services = {
    openssh.enable = true;

    jellyfin = {
      enable = true;
      user = "onat";
    };
  };

  boot.loader.grub.efiInstallAsRemovable = true;
  system.stateVersion = "24.11";
}
