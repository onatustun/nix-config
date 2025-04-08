{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, Q, exec, $terminal"
      "$mainMod, D, exec, $menu"
      "$mainMod, C, killactive"
      "$mainMod, U, togglesplit"

      "$mainMod, H, movefocus, l"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"
      "$mainMod, L, movefocus, r"
      "$mainMod, left, movefocus, l"
      "$mainMod, down, movefocus, d"
      "$mainMod, up, movefocus, u"
      "$mainMod, right, movefocus, r"

      "$mainMod SHIFT, H, swapwindow, l"
      "$mainMod SHIFT, J, swapwindow, d"
      "$mainMod SHIFT, K, swapwindow, u"
      "$mainMod SHIFT, L, swapwindow, r"
      "$mainMod SHIFT, left, swapwindow, l"
      "$mainMod SHIFT, down, swapwindow, d"
      "$mainMod SHIFT, up, swapwindow, u"
      "$mainMod SHIFT, right, swapwindow, r"

      "$mainMod CTRL, H, resizeactive, -60 0"
      "$mainMod CTRL, J, resizeactive, 0 60"
      "$mainMod CTRL, K, resizeactive, 0 -60"
      "$mainMod CTRL, L, resizeactive, 60 0"
      "$mainMod CTRL, left, resizeactive, -60 0"
      "$mainMod CTRL, down, resizeactive, 0 60"
      "$mainMod CTRL, up, resizeactive, 0 -60"
      "$mainMod CTRL, right, resizeactive, 60 0"
      
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
