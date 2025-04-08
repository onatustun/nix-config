let 
  navigation = {
    down = { key = "J"; arrow = "down"; dir = "d"; step = "prev"; };
    left = { key = "H"; arrow = "left"; dir = "l"; step = "prev"; };
    right = { key = "L"; arrow = "right"; dir = "r"; step = "next"; };
    up = { key = "K"; arrow = "up"; dir = "u"; step = "next"; };
  };

  makeBinds = mod: action: fn: 
    builtins.concatLists (builtins.attrValues (
      builtins.mapAttrs (name: nav: [
        "${mod}, ${nav.arrow}, ${action}, ${fn nav}"
        "${mod}, ${nav.key}, ${action}, ${fn nav}"
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
  ]++ (builtins.concatLists (builtins.genList (
    x: let
      ws = let
        c = (x + 1) / 10;
      in
      builtins.toString(x + 1 - (c * 10));
    in [
      "$mod CTRL, ${ws}, movetoworkspace, ${toString (x + 1)}"
      "$mod, ${ws}, workspace, ${toString (x + 1)}"
    ]
  ) 10));

  binde =
    makeBinds "$mod ALT" "scroller:cyclesize" (nav: nav.step) ++
    makeBinds "$mod CTRL" "movewindow" (nav: nav.dir) ++
    makeBinds "$mod" "movefocus" (nav: nav.dir);
}
