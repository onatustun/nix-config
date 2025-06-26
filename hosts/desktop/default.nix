{config, ...}: {
  imports = [./hardware-configuration.nix];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  networking.hostName = "laptop";
  services.xserver.videoDrivers = ["nvidia"];
  system.stateVersion = "24.11";
}
