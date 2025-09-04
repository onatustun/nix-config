{
  lib,
  inputs,
  isDesktop,
  isLaptop,
  pkgs,
  ...
}: let
  inherit (lib) readFile enabled concatMap attrValues optional mkMerge mkIf concatLists genList getExe;
  inherit (pkgs.nuenv) writeScriptBin;
  inherit (inputs) self;

  hyprland = writeScriptBin {
    name = "hyprland";
    script = readFile (self + "/scripts/hyprland.nu");
  };
in {
  programs.hyprland = enabled {
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.xdg-portal-hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = [
    inputs.hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.hyprcursor
    inputs.hyprland-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast
  ];

  home-manager.sharedModules = [
    {
      wayland.windowManager.hyprland = enabled {
        xwayland = enabled;

        systemd = enabled {
          enableXdgAutostart = true;
          variables = ["--all"];
        };

        settings = let
          navigation = {
            left = {
              key = "H";
              arrow = "left";
              dir = "l";
              amt = "-80 0";
            };
            down = {
              key = "J";
              arrow = "down";
              dir = "d";
              amt = "0 80";
            };
            up = {
              key = "K";
              arrow = "up";
              dir = "u";
              amt = "0 -80";
            };
            right = {
              key = "L";
              arrow = "right";
              dir = "r";
              amt = "80 0";
            };
          };

          makeBinds = mod: action: fn:
            concatMap (nav: [
              "${mod}, ${nav.arrow}, ${action nav}, ${fn nav}"
              "${mod}, ${nav.key},   ${action nav}, ${fn nav}"
            ]) (attrValues navigation);
        in {
          env = [
            "ELECTRON_OZONE_PLATFORM_HINT,auto"
            "NIXOS_OZONE_WL, 1"
            "MOZ_ENABLE_WAYLAND, 1"
            "QT_QPA_PLATFORM,wayland"
            "XDG_SESSION_TYPE,wayland"
            "HYPRCURSOR_SIZE,24"
            "HYPRCURSOR_THEME,hypr_Bibata-Modern-Ice"
            "WLR_NO_HARDWARE_CURSORS,1"
            "WLR_RENDERER_ALLOW_SOFTWARE,1"
            "XCURSOR_SIZE,24"
          ];

          exec-once =
            [
              "wl-paste --type image --watch cliphist store"
              "wl-paste --type text --watch cliphist store"
              "hyprctl setcursor hypr_Bibata-Modern-Ice 24"
            ]
            ++ optional isLaptop "swayidle";

          monitor = mkMerge [
            (mkIf isDesktop [
              "DP-2, 1920x1080@240, 0x0, 1, transform, 2"
              "HDMI-A-1, 1920x1080@240, auto-down, 1"
            ])
            (mkIf isLaptop [
              "eDP-1, 2256x1504@60, 0x0, 1.5667"
              "DP-3, 3840x2400, auto-down, 2.4"
            ])
          ];

          dwindle = {
            force_split = 2;
            special_scale_factor = 1.0;
            split_width_multiplier = 1.0;
            use_active_for_splits = true;
            pseudotile = "yes";
            preserve_split = "yes";
          };

          general = {
            border_size = 2;
            gaps_in = 8;
            gaps_out = 8;
            layout = "dwindle";
            resize_on_border = true;
          };

          decoration = {
            rounding = 0;
            active_opacity = 1;
            inactive_opacity = 1;
            blur.enabled = false;
            shadow.enabled = false;
          };

          animations = {
            enabled = true;
            first_launch_animation = true;
            workspace_wraparound = true;

            bezier = [
              "easeOutQuint,0.23,1,0.32,1"
              "easeInOutCubic,0.65,0.05,0.36,1"
              "linear,0,0,1,1"
              "almostLinear,0.5,0.5,0.75,1.0"
              "quick,0.15,0,0.1,1"
            ];

            animation = [
              "global, 1, 10, default"
              "border, 1, 5.39, easeOutQuint"
              "windows, 1, 4.79, easeOutQuint"
              "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
              "windowsOut, 1, 1.49, linear, popin 87%"
              "fadeIn, 1, 1.73, almostLinear"
              "fadeOut, 1, 1.46, almostLinear"
              "fade, 1, 3.03, quick"
              "layers, 1, 3.81, easeOutQuint"
              "layersIn, 1, 4, easeOutQuint, fade"
              "layersOut, 1, 1.5, linear, fade"
              "fadeLayersIn, 1, 1.79, almostLinear"
              "fadeLayersOut, 1, 1.39, almostLinear"
              "workspaces, 1, 1.94, almostLinear, fade"
              "workspacesIn, 1, 1.21, almostLinear, fade"
              "workspacesOut, 1, 1.94, almostLinear, fade"
            ];
          };

          input = {
            kb_layout = "us";
            follow_mouse = 1;
            accel_profile = "flat";
            touchpad.natural_scroll = false;
          };

          gestures.workspace_swipe = false;

          misc = {
            disable_hyprland_logo = true;
            force_default_wallpaper = 0;
            middle_click_paste = false;
            vfr = true;
          };

          "$mod" = "SUPER";

          bind =
            [
              "$mod, D, exec, rofi -show"
              "$mod, E, exec, thunar"
              "$mod, Q, exec, ghostty"
              "$mod, Z, exec, zen-twilight"
              "$mod, S, togglesplit"
              "$mod, C, killactive"
              "$mod Shift, F, fullscreen, 0"
              "$mod, V, togglefloating"
              "$mod Shift, E, exit"
              "$mod, W, exec, nu ${getExe hyprland}"
            ]
            ++ (
              concatLists (genList (x: let
                  ws = toString (x + 1 - (((x + 1) / 10) * 10));
                in [
                  "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                  "$mod, ${ws}, workspace, ${toString (x + 1)}"
                ])
                10)
            );

          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];

          bindel = [
            ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ];

          bindl = [
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous "
          ];

          binde =
            makeBinds "$mod ALT" (_: "resizeactive") (nav: nav.amt)
            ++ makeBinds "$mod CTRL" (_: "movewindow") (nav: nav.dir)
            ++ makeBinds "$mod" (_: "movefocus") (nav: nav.dir);

          layerrule = ["noanim, rofi"];

          windowrulev2 = [
            "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
            "suppressevent maximize, class:.*"
          ];
        };
      };
    }
  ];
}
