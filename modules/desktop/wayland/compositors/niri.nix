{
  flake.modules = {
    nixos = {
      niri = {self, ...}: {
        imports = [self.modules.nixos.niri'];
        home-manager.sharedModules = [self.modules.homeManager.niri];
      };

      niri' = {
        inputs',
        niri,
        pkgs,
        ...
      }: let
        package = inputs'.niri.packages.niri-unstable;
      in {
        imports = [niri.nixosModules.niri];
        niri-flake.cache.enable = false;

        programs.niri = {
          enable = true;
          inherit package;
        };

        environment.systemPackages = [
          pkgs.gnome-keyring
          pkgs.xdg-desktop-portal-gnome
          pkgs.xdg-desktop-portal-gtk
        ];
      };
    };

    homeManager.niri = {
      lib,
      inputs',
      pkgs,
      config,
      ...
    }: let
      package = inputs'.niri.packages.niri-unstable;
    in {
      home.packages = [
        pkgs.gnome-keyring
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ];

      systemd.user.services.xwayland-satellite.Install.WantedBy = ["niri.service"];

      xdg.portal = {
        extraPortals = [pkgs.xdg-desktop-portal-gtk];
        configPackages = [package];
      };

      programs.niri.settings = {
        environment = {
          CLUTTER_BACKEND = "wayland";
          DISPLAY = ":0";
          ELECTRON_OZONE_PLATFORM_HINT = "auto";
          GDK_BACKEND = "wayland,x11";
          MOZ_ENABLE_WAYLAND = "1";
          NIXOS_OZONE_WL = "1";
          SDL_VIDEODRIVER = "wayland";

          QT_QPA_PLATFORM = "wayland";
          QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

          WLR_NO_HARDWARE_CURSORS = "1";
          WLR_RENDERER_ALLOW_SOFTWARE = "1";

          HYPRCURSOR_SIZE = "24";
          HYPRCURSOR_THEME = "hypr_Bibata-Modern-Ice";
          XCURSOR_SIZE = "24";

          XDG_CURRENT_DESKTOP = "niri";
          XDG_SESSION_TYPE = "wayland";
        };

        spawn-at-startup = let
          makeCommand = command: {command = [command];};
        in [
          (makeCommand "xwayland-satellite")
          (makeCommand "wl-paste --type image --watch cliphist store")
          (makeCommand "wl-paste --type text --watch cliphist store")
          (makeCommand "wl-clip-persist --clipboard both")
          (makeCommand "brightness -r")
          (makeCommand "wvkbd-mobintl --hidden")
          (makeCommand "yubikey-touch-detector")
          (makeCommand "swayidle")
        ];

        outputs."eDP-1" = {
          focus-at-startup = true;
          background-color = "${config.stylix.base16Scheme.base00}";
          scale = 1.5;

          mode = {
            width = 2256;
            height = 1504;
            refresh = 60.000000;
          };
        };

        layout = {
          always-center-single-column = true;
          center-focused-column = "on-overflow";
          default-column-width = {proportion = 0.5;};
          gaps = 0;

          border = {
            enable = true;
            width = 2;
          };

          preset-window-heights = [
            {proportion = 1.0 / 3.0;}
            {proportion = 1.0 / 2.0;}
            {proportion = 1.0 / 1.5;}
          ];

          preset-column-widths = [
            {proportion = 1.0 / 3.0;}
            {proportion = 1.0 / 2.0;}
            {proportion = 1.0 / 1.5;}
          ];

          struts = let
            str = 16;
          in {
            left = str;
            bottom = 0;
            top = 0;
            right = str;
          };
        };

        binds = {
          "Mod+D".action.spawn = ["rofi" "-show"];
          "Mod+E".action.spawn = "thunar";
          "Mod+Q".action.spawn = ["${lib.meta.getExe' pkgs.nushell "nu"}" "-c" "${lib.meta.getExe inputs'.ghostty.packages.default}"];
          "Mod+Z".action.spawn = "zen-beta";
          "Mod+W".action.spawn = ["pkill" "-SIGUSR1" "waybar"];

          "Mod+C".action.close-window = [];
          "Mod+O".action.toggle-overview = [];
          "Mod+Shift+E".action.quit = [];

          "Mod+F".action.maximize-column = [];
          "Mod+Shift+F".action.fullscreen-window = [];

          "Mod+V".action.toggle-window-floating = [];
          "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];

          "Mod+M".action.center-visible-columns = [];
          "Mod+Comma".action.consume-or-expel-window-left = [];
          "Mod+Period".action.consume-or-expel-window-right = [];

          "Mod+H".action.focus-column-left = [];
          "Mod+J".action.focus-window-or-workspace-down = [];
          "Mod+K".action.focus-window-or-workspace-up = [];
          "Mod+L".action.focus-column-right = [];
          "Mod+Left".action.focus-column-left = [];
          "Mod+Down".action.focus-window-or-workspace-down = [];
          "Mod+Up".action.focus-window-or-workspace-up = [];
          "Mod+Right".action.focus-column-right = [];

          "Mod+BracketLeft".action.focus-column-first = [];
          "Mod+BracketRight".action.focus-column-last = [];

          "Mod+Ctrl+H".action.move-column-left = [];
          "Mod+Ctrl+J".action.move-window-down-or-to-workspace-down = [];
          "Mod+Ctrl+K".action.move-window-up-or-to-workspace-up = [];
          "Mod+Ctrl+L".action.move-column-right = [];
          "Mod+Ctrl+Left".action.move-column-left = [];
          "Mod+Ctrl+Down".action.move-column-to-workspace-down = [];
          "Mod+Ctrl+Up".action.move-column-to-workspace-up = [];
          "Mod+Ctrl+Right".action.move-column-right = [];

          "Super+Alt+H".action.set-column-width = "-25%";
          "Super+Alt+J".action.set-window-height = "+25%";
          "Super+Alt+K".action.set-window-height = "-25%";
          "Super+Alt+L".action.set-column-width = "+25%";
          "Super+Alt+Left".action.set-column-width = "-25%";
          "Super+Alt+Down".action.set-window-height = "+25%";
          "Super+Alt+Up".action.set-window-height = "-25%";
          "Super+Alt+Right".action.set-column-width = "+25%";

          "Mod+1".action.focus-workspace = 1;
          "Mod+2".action.focus-workspace = 2;
          "Mod+3".action.focus-workspace = 3;
          "Mod+4".action.focus-workspace = 4;
          "Mod+5".action.focus-workspace = 5;
          "Mod+6".action.focus-workspace = 6;
          "Mod+7".action.focus-workspace = 7;
          "Mod+8".action.focus-workspace = 8;
          "Mod+9".action.focus-workspace = 9;
          "Mod+0".action.focus-workspace = 10;
          "Mod+Shift+1".action.move-column-to-workspace = 1;
          "Mod+Shift+2".action.move-column-to-workspace = 2;
          "Mod+Shift+3".action.move-column-to-workspace = 3;
          "Mod+Shift+4".action.move-column-to-workspace = 4;
          "Mod+Shift+5".action.move-column-to-workspace = 5;
          "Mod+Shift+6".action.move-column-to-workspace = 6;
          "Mod+Shift+7".action.move-column-to-workspace = 7;
          "Mod+Shift+8".action.move-column-to-workspace = 8;
          "Mod+Shift+0".action.move-column-to-workspace = 10;

          "XF86AudioMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
          "XF86AudioMicMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];
          "XF86AudioPlay".action.spawn = ["${lib.meta.getExe pkgs.playerctl}" "play-pause"];
          "XF86AudioStop".action.spawn = ["${lib.meta.getExe pkgs.playerctl}" "pause"];
          "XF86AudioPrev".action.spawn = ["${lib.meta.getExe pkgs.playerctl}" "previous"];
          "XF86AudioNext".action.spawn = ["${lib.meta.getExe pkgs.playerctl}" "next"];
          "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"];
          "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
        };

        window-rules = [
          {
            clip-to-geometry = true;
            draw-border-with-background = false;

            geometry-corner-radius = let
              radius = 0.0;
            in {
              bottom-left = radius;
              bottom-right = radius;
              top-left = radius;
              top-right = radius;
            };
          }
        ];

        prefer-no-csd = true;

        hotkey-overlay = {
          skip-at-startup = true;
          hide-not-bound = true;
        };

        xwayland-satellite = {
          enable = true;
          path = lib.meta.getExe inputs'.xwayland-satellite.packages.xwayland-satellite;
        };

        cursor = let
          cursorTheme = "Bibata-Modern-Ice";
          cursorSize = 24;
        in {
          theme = cursorTheme;
          size = cursorSize;
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
    };
  };
}
