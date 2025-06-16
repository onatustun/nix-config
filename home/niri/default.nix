{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [inputs.niri.homeModules.niri];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      environment = {
        CLUTTER_BACKEND = "wayland";
        DISPLAY = null;
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
      };

      input = {
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
        };

        focus-follows-mouse.enable = true;
        warp-mouse-to-focus = true;
        workspace-auto-back-and-forth = true;
      };

      outputs = {
        "eDP-1" = {
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
      };

      overview = {
        backdrop-color = "transparent";
      };

      gestures.hot-corners.enable = true;

      layout = {
        focus-ring.enable = false;

        border = {
          enable = true;
          width = 1;
          active.color = "#7fb4ca";
          inactive.color = "#090e13";
        };

        shadow.enable = true;

        preset-column-widths = [
          {proportion = 0.25;}
          {proportion = 0.5;}
          {proportion = 0.75;}
          {proportion = 1.0;}
        ];
        default-column-width = {proportion = 0.5;};

        gaps = 6;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };

        tab-indicator = {
          hide-when-single-tab = true;
          place-within-column = true;
          position = "left";
          corner-radius = 20.0;
          gap = -12.0;
          gaps-between-tabs = 10.0;
          width = 4.0;
          length.total-proportion = 0.1;
        };
      };

      binds = with config.lib.niri.actions; {
        "Mod+D".action = spawn "${pkgs.rofi}/bin/rofi";
        "Mod+Q".action = spawn "${pkgs.ghostty}/bin/ghostty";

        "Mod+C".action = close-window;
        "Mod+S".action = switch-preset-column-width;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = expand-column-to-available-width;
        "Mod+Space".action = toggle-window-floating;
        "Mod+W".action = toggle-column-tabbed-display;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;
        "Mod+Tab".action = switch-focus-between-floating-and-tiling;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Plus".action = set-column-width "+10%";
        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Plus".action = set-window-height "+10%";

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;
        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-workspace-down;
        "Mod+Up".action = focus-workspace-up;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-column-to-workspace-up;
        "Mod+Shift+J".action = move-column-to-workspace-down;

        "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
      };
    };
  };
}
