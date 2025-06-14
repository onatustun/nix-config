{
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.xserver.videoDrivers = [
    "nvidia"
  ];

  system.stateVersion = "24.11";
}
