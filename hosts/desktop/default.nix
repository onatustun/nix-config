{
  config,
  pkgs,
  username,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  users.users.${username} = {
    shell = pkgs.fish;
    useDefaultShell = true;
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

  home-manager = {
    users.${username}.home.stateVersion = "24.11";

    sharedModules = [
      {
        wayland.windowManager.hyprland.settings.monitor = [
          "DP-2, 1920x1080@240, 0x0, 1, transform, 2"
          "HDMI-A-1, 1920x1080@240, auto-down, 1"
        ];
      }
    ];
  };

  system.stateVersion = "24.11";
}
