{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [inputs.hardware.nixosModules.framework-13-7040-amd];

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

  services = {
    fwupd.enable = true;
    power-profiles-daemon.enable = true;
  };

  environment.systemPackages = with pkgs; [
    framework-tool
    power-profiles-daemon
  ];

  hardware.framework.enableKmod = true;
  system.stateVersion = "24.11";
}
