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
    cliphist
    dunst
    networkmanagerapplet
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;

    settings = {
      exec-once = [
        "hyprpaper"
        "pkill waybar & sleep 0.5 && waybar"
        "wl-paste --type image --watch cliphist store"
        "wl-paste --type text --watch cliphist store"
      ];

      env = [
        "MOZ_ENABLE_WAYLAND, 1" 
        "NIXOS_OZONE_WL, 1" 
        "QT_QPA_PLATFORM,wayland"
        "WLR_NO_HARDWARE_CURSORS,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        "XDG_SESSION_TYPE,wayland"
      ];

      monitor = "eDP-1, 2256x1504@60, 0x0, 1";

      "$menu" = "rofi -show";
      "$terminal" = "ghostty";

      cursor.no_hardware_cursors = "true";
      input.kb_layout = "us";
      gestures.workspace_swipe = "false";

      windowrulev2 = [
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "suppressevent maximize, class:.*"
      ];
    };
  };
}
