{
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      warn-dirty = false;

      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than-5d";
    };

    optimise.automatic = true;
  };
  
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
