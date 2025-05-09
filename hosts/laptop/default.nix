{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.framework-13-7040-amd
    ./hardware-configuration.nix
  ];
  
  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  programs = {
    fish.enable = true;
    hyprland.enable = true;
  };

  users = {
    defaultUserShell = pkgs.fish;

    users.onat = {
      isNormalUser = true;
      useDefaultShell = true;
      shell = pkgs.fish;

      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  hardware.framework.enableKmod = true;
  services.fwupd.enable = true;
  system.stateVersion = "24.11";
}
