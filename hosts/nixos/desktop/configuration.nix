{
  config,
  username,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  users.users.${username}.extraGroups = [
    "audio"
    "input"
    "libvirt"
    "networkmanager"
    "power"
    "storage"
    "video"
    "wheel"
  ];

  system.stateVersion = "24.11";
}
