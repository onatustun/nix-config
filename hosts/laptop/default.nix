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
    hyprland = {
      enable = true;
      withUWSM = true;
    };
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

  boot.loader.systemd-boot.enable = true;
  services.power-profiles-daemon.enable = true;
  system.stateVersion = "24.11";
}
