{
  pkgs,
  lib,
  ...
}: {
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  imports = [
    ./hardware-configuration.nix
    ../common
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs = {
    zsh = {
      enable = true;
      promptInit = lib.mkForce '''';
    };
    hyprland.enable = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;

    users.onat = {
      isNormalUser = true;

      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  boot.loader.systemd-boot.enable = true;
  services.power-profiles-daemon.enable = true;
  system.stateVersion = "24.11";
}
