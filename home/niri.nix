{
  config,
  ...
}: {
  programs.niri = {
    enable = true;
    settings = {
      environment = {
        DISPLAY = ":0";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_TYPE = "wayland";
      };

      layout.gaps = 12;

      binds = with config.lib.niri.actions; {
        "Mod+Q".action = spawn "ghostty";
        "Mod+C".action = close-window;
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
        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Up".action = move-column-to-workspace-up;
        "Mod+Shift+Down".action = move-column-to-workspace-down;
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+Ctrl+1".action = move-column-to-workspace 1;
        "Mod+Ctrl+2".action = move-column-to-workspace 2;
        "Mod+Ctrl+3".action = move-column-to-workspace 3;
        "Mod+Ctrl+4".action = move-column-to-workspace 4;
        "Mod+Ctrl+5".action = move-column-to-workspace 5;
        "Mod+Ctrl+6".action = move-column-to-workspace 6;
        "Mod+Ctrl+7".action = move-column-to-workspace 7;
        "Mod+Ctrl+8".action = move-column-to-workspace 8;
        "Mod+Ctrl+9".action = move-column-to-workspace 9;
      };

      outputs = {
        "eDP-1" = {
          scale = 1.333667;

          position = {
            x = 0;
            y = 0;
          };
        };
      };
    };
  };
}
