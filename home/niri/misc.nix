{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.niri.settings = {
    prefer-no-csd = true;

    hotkey-overlay = {
      skip-at-startup = true;
      hide-not-bound = true;
    };

    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite-unstable;
    };

    cursor = {
      theme = "${config.home.pointerCursor.name}";
      size = config.home.pointerCursor.size;
    };

    input = {
      keyboard.xkb.layout = "us";
      mod-key = "Super";
      warp-mouse-to-focus.enable = true;
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "5%";
      };
    };
  };
}
