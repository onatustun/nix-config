{
  flake.modules = {
    nixos = {
      hyprland = {self, ...}: {
        imports = [self.modules.nixos.hyprland'];
        home-manager.sharedModules = [self.modules.homeManager.hyprland];
      };

      hyprland' = {
        inputs',
        pkgs,
        ...
      }: {
        nix.settings = {
          extra-substituters = ["https://hyprland.cachix.org"];
          extra-trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        };

        programs.hyprland = {
          enable = true;
          package = inputs'.hyprland.packages.default;
          portalPackage = inputs'.xdg-portal-hyprland.packages.default;
        };

        environment.systemPackages = [
          pkgs.grimblast
          pkgs.remmina
          pkgs.wayvnc
        ];

        xdg.portal.wlr.enable = true;
      };
    };

    homeManager.hyprland = {
      pkgs,
      lib,
      config,
      inputs',
      hostName,
      isDesktop,
      isLaptop,
      ...
    }: {
      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        systemd = {
          enable = true;
          enableXdgAutostart = true;
          variables = ["--all"];
        };

        settings = {
          env = [
            "ELECTRON_OZONE_PLATFORM_HINT,auto"
            "NIXOS_OZONE_WL, 1"
            "MOZ_ENABLE_WAYLAND, 1"
            "QT_QPA_PLATFORM,wayland"
            "XDG_SESSION_TYPE,wayland"
            "HYPRCURSOR_SIZE,${toString config.home.pointerCursor.hyprcursor.size}"
            "HYPRCURSOR_THEME,hypr_${config.home.pointerCursor.name}"
            "WLR_NO_HARDWARE_CURSORS,1"
            "WLR_RENDERER_ALLOW_SOFTWARE,1"
            "XCURSOR_SIZE,${toString config.home.pointerCursor.size}"
          ];

          exec-once =
            [
              "${lib.meta.getExe' pkgs.wl-clipboard "wl-paste"} --watch cliphist store"
              "${lib.meta.getExe' pkgs.wl-clipboard "wl-paste"} --type image --watch cliphist store"
              "${lib.meta.getExe' pkgs.wl-clipboard "wl-paste"} --type text --watch cliphist store"
              "${lib.meta.getExe' inputs'.hyprland.packages.default "hyprctl"} setcursor hypr_${config.home.pointerCursor.name} ${toString config.home.pointerCursor.hyprcursor.size}"
              "${lib.meta.getExe' pkgs.wvkbd "wvkbd-mobintl"} --hidden"
              (lib.meta.getExe pkgs.yubikey-touch-detector)
              "${lib.meta.getExe pkgs.wayvnc} -Linfo -o ${
                if isDesktop
                then "HDMI-A-1"
                else "eDP-1"
              } ${hostName}.tail32e3ea.ts.net 5901"
              "${lib.meta.getExe' inputs'.quickshell.packages.default "qs"}"
            ]
            ++ lib.lists.optional isLaptop (lib.meta.getExe pkgs.swayidle);

          monitor =
            lib.lists.optionals isDesktop [
              "DP-2, 1920x1080@240, 0x0, 1, transform, 2"
              "HDMI-A-1, 1920x1080@240, auto-down, 1"
            ]
            ++ lib.lists.optionals isLaptop [
              "eDP-1, 2256x1504@60, 0x0, 1.5667"
              "DP-3, 3840x2400, auto-down, 2.4"
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
            gaps_out = 16;
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

          misc = {
            disable_hyprland_logo = true;
            force_default_wallpaper = 0;
            middle_click_paste = false;
            vfr = true;
          };

          bind = [
            "SUPER, D, exec, ${lib.meta.getExe config.programs.rofi.package} -show"
            "SUPER, E, exec, ${lib.meta.getExe pkgs.xfce.thunar}"
            "SUPER, Q, exec, ${lib.meta.getExe config.programs.ghostty.package}"
            "SUPER, Z, exec, ${lib.meta.getExe' inputs'.zen-browser.packages.beta "zen-beta"}"
            "SUPER, S, togglesplit"
            "SUPER, C, killactive"
            "SUPER Shift, F, fullscreen, 0"
            "SUPER, V, togglefloating"
            "SUPER Shift, E, exit"

            "SUPER, 1, workspace, 1"
            "SUPER, 2, workspace, 2"
            "SUPER, 3, workspace, 3"
            "SUPER, 4, workspace, 4"
            "SUPER, 5, workspace, 5"
            "SUPER, 6, workspace, 6"
            "SUPER, 7, workspace, 7"
            "SUPER, 8, workspace, 8"
            "SUPER, 9, workspace, 9"
            "SUPER, 0, workspace, 10"

            "SUPER SHIFT, 1, movetoworkspace, 1"
            "SUPER SHIFT, 2, movetoworkspace, 2"
            "SUPER SHIFT, 3, movetoworkspace, 3"
            "SUPER SHIFT, 4, movetoworkspace, 4"
            "SUPER SHIFT, 5, movetoworkspace, 5"
            "SUPER SHIFT, 6, movetoworkspace, 6"
            "SUPER SHIFT, 7, movetoworkspace, 7"
            "SUPER SHIFT, 8, movetoworkspace, 8"
            "SUPER SHIFT, 9, movetoworkspace, 9"
            "SUPER SHIFT, 0, movetoworkspace, 10"
          ];

          bindm = [
            "SUPER, mouse:272, movewindow"
            "SUPER, mouse:273, resizewindow"
          ];

          bindel = [
            ", XF86AudioRaiseVolume, exec, ${lib.meta.getExe' pkgs.wireplumber "wpctl"} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, ${lib.meta.getExe' pkgs.wireplumber "wpctl"} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, ${lib.meta.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", XF86AudioMicMute, exec, ${lib.meta.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ];

          bindl = [
            ", XF86AudioNext, exec, ${lib.meta.getExe pkgs.playerctl} next"
            ", XF86AudioPause, exec, ${lib.meta.getExe pkgs.playerctl} play-pause"
            ", XF86AudioPlay, exec, ${lib.meta.getExe pkgs.playerctl} play-pause"
            ", XF86AudioPrev, exec, ${lib.meta.getExe pkgs.playerctl} previous "
          ];

          binde = [
            "SUPER ALT, H, resizeactive, -80 0"
            "SUPER ALT, J, resizeactive, 0 80"
            "SUPER ALT, K, resizeactive, 0 -80"
            "SUPER ALT, L, resizeactive, 80 0"
            "SUPER ALT, left, resizeactive, -80 0"
            "SUPER ALT, down, resizeactive, 0 80"
            "SUPER ALT, up, resizeactive, 0 -80"
            "SUPER ALT, right, resizeactive, 80 0"

            "SUPER CTRL, H, movewindow, l"
            "SUPER CTRL, J, movewindow, d"
            "SUPER CTRL, K, movewindow, u"
            "SUPER CTRL, L, movewindow, r"
            "SUPER CTRL, left, movewindow, l"
            "SUPER CTRL, down, movewindow, d"
            "SUPER CTRL, up, movewindow, u"
            "SUPER CTRL, right, movewindow, r"

            "SUPER, H, movefocus, l"
            "SUPER, J, movefocus, d"
            "SUPER, K, movefocus, u"
            "SUPER, L, movefocus, r"
            "SUPER, left, movefocus, l"
            "SUPER, down, movefocus, d"
            "SUPER, up, movefocus, u"
            "SUPER, right, movefocus, r"
          ];

          layerrule = ["noanim, rofi"];

          windowrulev2 = [
            "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
            "suppressevent maximize, class:.*"
          ];
        };
      };
    };
  };
}
