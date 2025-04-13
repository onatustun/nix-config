{
  pkgs,
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
    zsh.enable = true;
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

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true; 
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };
  services.power-profiles-daemon.enable = true;
  system.stateVersion = "24.11";
}
