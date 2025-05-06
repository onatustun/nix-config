{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
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

      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  services.fwupd.enable = true;
  hardware.framework.enableKmod = true;
  system.stateVersion = "24.11";
}
