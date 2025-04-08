{
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./ricing.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    dunst
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;

    settings = {
      exec-once = [
        "pkill waybar & sleep 0.5 && waybar"
        "hyprpaper"
      ];

      env = [
        "NIXOS_OZONE_WL, 1" 
        "MOZ_ENABLE_WAYLAND, 1" 
        "XDG_SESSION_TYPE,wayland"
        "WLR_NO_HARDWARE_CURSORS,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        "QT_QPA_PLATFORM,wayland"
      ];

      monitor = "eDP-1, 2256x1504@60, 0x0, 1";

      "$terminal" = "ghostty";
      "$menu" = "rofi -show";

      cursor.no_hardware_cursors = "true";
      input.kb_layout = "us";
      gestures.workspace_swipe = "false";

      windowrule = [ "noinitialfocus" ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
