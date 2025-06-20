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
    xdg-desktop-portal-hyprland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [
        "--all"
      ];
    };

    settings = hyprSettings;
  };
}
