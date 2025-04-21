{
  lib,
  pkgs,
  ...
}: 
let
  configFiles = [
    ./binds.nix
    ./env.nix
    ./exec.nix
    ./input.nix
    ./misc.nix
    ./ricing.nix
    ./rules.nix
  ];

  hyprSettings = lib.foldl' (
    acc: file: acc // (import file)
  ) {} configFiles;
in {
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    dunst
    networkmanagerapplet
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    plugins = with pkgs.hyprlandPlugins; [
      hyprscroller
    ];

    systemd = {
      enable = true;

      variables = [
        "--all"
      ];
    };

    settings = hyprSettings;
  };
}
