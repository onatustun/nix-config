{
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun";
      font = "JetBrainsMono Nerd Font Mono";
    };

    theme = lib.mkForce {
      "*" = {
        font = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
}
