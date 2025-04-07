{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./binds.nix
    ./ricing.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    dunst
    hyprshot
    hyprsunset
    wl-clipboard
    xdg-desktop-portal-hyprland
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd = {
      enable = false;
      variables = [ "all" ];
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

    settings = {
      exec-once = [
        "pkill waybar & sleep 0.5 && waybar"
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
      "$menu" = "tofi-drun --drun-launch=true";

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
