{
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  
  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
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

  services.power-profiles-daemon.enable = true;
  system.stateVersion = "24.11";
}
