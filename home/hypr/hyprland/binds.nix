let
  navigation = {
    left = {
      key = "H";
      arrow = "left";
      dir = "l";
      cycle = "scroller:cyclewidth";
      step = "prev";
    };
    down = {
      key = "J";
      arrow = "down";
      dir = "d";
      cycle = "scroller:cycleheight";
      step = "prev";
    };
    up = {
      key = "K";
      arrow = "up";
      dir = "u";
      cycle = "scroller:cycleheight";
      step = "next";
    };
    right = {
      key = "L";
      arrow = "right";
      dir = "r";
      cycle = "scroller:cyclewidth";
      step = "next";
    };
  };

  makeBinds = mod: action: fn: 
    builtins.concatLists (builtins.attrValues (
      builtins.mapAttrs (name: nav: [
        "${mod}, ${nav.arrow}, ${action nav}, ${fn nav}"
        "${mod}, ${nav.key}, ${action nav}, ${fn nav}"
      ]) navigation
    ));
in {
  "$mod" = "SUPER";

  bind = [
    "$mod, Q, exec, ghostty"
    "$mod, D, exec, rofi -show"

    "$mod, C, killactive"
    "$mod, F, fullscreen, 0"
    "$mod, V, togglefloating"

    "$mod, bracketleft, scroller:movefocus, begin"
    "$mod, bracketright, scroller:movefocus, end"

    "$mod CTRL, bracketleft, scroller:movewindow, begin"
    "$mod CTRL, bracketright, scroller:movewindow, end"

    "$mod, I, scroller:setmode, col"
    "$mod, U, scroller:setmode, row"

    "$mod, T, togglegroup"
    "$mod, G, changegroupactive"
  ] ++ (
    builtins.concatLists (
      builtins.genList (
        x:
          let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod CTRL, ${ws}, movetoworkspace, ${toString (x + 1)}"
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
          ]
      ) 10
    )
  );

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

  binde =
    makeBinds "$mod ALT" (nav: nav.cycle) (nav: nav.step) ++
    makeBinds "$mod CTRL" (_: "movewindow") (nav: nav.dir) ++
    makeBinds "$mod" (_: "movefocus") (nav: nav.dir);
}
