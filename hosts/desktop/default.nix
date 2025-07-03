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

  home-manager.users.${username}.home.stateVersion = "24.11";
  system.stateVersion = "24.11";
}
