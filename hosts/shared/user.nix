{
  hostName,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.niri.nixosModules.niri
  ];

  networking = {
    networkmanager.enable = true;
    hostName = hostName;
  };

  programs = {
    fish.enable = true;
    hyprland.enable = true;

    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  };

  niri-flake.cache.enable = false;

  users = {
    defaultUserShell = pkgs.fish;

    users.onat = {
      isNormalUser = true;
      useDefaultShell = true;
      shell = pkgs.fish;

      extraGroups = [
        "audio"
        "input"
        "libvirt"
        "networkmanager"
        "power"
        "storage"
        "video"
        "wheel"
      ];
    };
  };
}
