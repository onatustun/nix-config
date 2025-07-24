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
    caddy
    jellyfin
    jellyfin-ffmpeg
    jellyfin-web
  ];

  services = {
    openssh.enable = true;
    jellyfin.enable = true;

    caddy = {
      enable = true;
      virtualHosts."https://jellyfin.ust.sh".extraConfig = ''
        reverse_proxy 127.0.0.1:8096
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];
  boot.loader.grub.efiInstallAsRemovable = true;
  system.stateVersion = "24.11";
}
