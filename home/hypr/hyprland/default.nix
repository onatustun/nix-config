{
  isLaptop,
  lib,
  pkgs,
  ...
}: let
  configFiles = [
    ./binds.nix
    ./env.nix
    ./exec.nix
    ./input.nix
    ./misc.nix
    ./ricing.nix
    ./rules.nix
  ];

  hyprSettings =
    lib.foldl' (
      acc: file:
        acc
        // (
          if lib.functionArgs (import file) ? isLaptop
          then (import file) {inherit isLaptop lib;}
          else (import file) {}
        )
    ) {}
    configFiles;
in {
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    dunst
    networkmanagerapplet
    playerctl
    wl-clipboard
    xdg-desktop-portal-hyprland
    xdg-user-dirs
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [pkgs.hyprlandPlugins.hyprscroller];

    systemd = {
      enable = true;
      variables = ["--all"];
    };

    settings = hyprSettings;
  };
}
