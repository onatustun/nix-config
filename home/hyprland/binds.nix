{...}: let
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
    builtins.concatLists (
      builtins.attrValues (
        builtins.mapAttrs (name: nav: [
          "${mod}, ${nav.arrow}, ${action nav}, ${fn nav}"
          "${mod}, ${nav.key}, ${action nav}, ${fn nav}"
        ])
        navigation
      )
    );
in {
  "$mod" = "SUPER";

  bind =
    [
      "$mod, D, exec, rofi -show"
      "$mod, E, exec, thunar"
      "$mod, Q, exec, ghostty"

      "$mod, S, togglesplit"
      "$mod, C, killactive"
      "$mod, F, fullscreen, 0"
      "$mod, V, togglefloating"
      "$mod Shift, E, exit"
    ]
    ++ (builtins.concatLists (
      builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in [
          "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
        ]
      )
      10
    ));

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

  bindel = [
    ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
    ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
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
}
