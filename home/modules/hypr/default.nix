{
  imports = [
    ./binds.nix
    ./ricing.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd.enable = true;

    settings = {
      monitor = "eDP-1, 2256x1504@60, 0x0, 1";

      "$terminal" = "ghostty";
      "$menu" = "tofi-drun --drun-launch=true";

      cursor.no_hardware_cursors = "true";
      input.kb_layout = "us";
      gestures.workspace_swipe = "false";

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
