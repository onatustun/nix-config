{
  inputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.framework-13-7040-amd
    ./hardware-configuration.nix
  ];
  
  networking.hostName = "laptop";
  hardware.framework.enableKmod = true;
  services.fwupd.enable = true;
  system.stateVersion = "24.11";
}
