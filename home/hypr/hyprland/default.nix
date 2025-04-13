{
  monitorSpec,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    dunst
    networkmanagerapplet
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = with pkgs.hyprlandPlugins;[
      hyprscroller
    ];

    systemd = {
      enable = true;
      variables = [
        "--all"
      ];
    };

    xwayland.enable = true;

    settings = let
      ricing = import ./ricing.nix;
      binds = import ./binds.nix;
    in ricing // binds // {      
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

      monitor = "${monitorSpec},preferred,auto,1.333667";

      cursor.no_hardware_cursors = "true";
      input.kb_layout = "us";

      layerrule = [
        "noanim, rofi"
        "blur, rofi"
      ];

      windowrulev2 = [
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "suppressevent maximize, class:.*"
      ];
    };
  };
}
