{ 
  lib,
  pkgs,
  ... 
}: {
  dconf.settings = {
    "org/gnome/shell/extensions/paperwm/keybindings" = {
      close-window = ["<Super>C"];

      move-down = ["<Shift><Super>J" "<Shift><Super>Down"];
      move-left = ["<Shift><Super>H" "<Shift><Super>Left"];
      move-right = ["<Shift><Super>L" "<Shift><Super>Right"];
      move-up = ["<Shift><Super>K" "<Shift><Super>Up"];

      resize-h-dec = ["<Control><Super>Down" "<Control><Super>J"];
      resize-h-inc = ["<Control><Super>Up" "<Control><Super>K"];
      resize-w-dec = ["<Control><Super>Left" "<Control><Super>H"];
      resize-w-inc = ["<Control><Super>Right" "<Control><Super>L"];

      switch-down = ["<Super>J" "<Super>Down"];
      switch-left = ["<Super>H" "<Super>Left"];
      switch-right = ["<Super>L" "<Super>Right"];
      switch-up = ["<Super>K" "<Super>Up"];
    };

    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-1 =  [ "<Super><Shift>1" ];
      move-to-workspace-10 = [ "<Super><Shift>0" ];
      move-to-workspace-2 = [ "<Super><Shift>2" ];
      move-to-workspace-3 = [ "<Super><Shift>3" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
      move-to-workspace-5 = [ "<Super><Shift>5" ];
      move-to-workspace-6 = [ "<Super><Shift>6" ];
      move-to-workspace-7 = [ "<Super><Shift>7" ];
      move-to-workspace-8 = [ "<Super><Shift>8" ];
      move-to-workspace-9 = [ "<Super><Shift>9" ];

      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-10 = [ "<Super>0" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      switch-to-workspace-7 = [ "<Super>7" ];
      switch-to-workspace-8 = [ "<Super>8" ];
      switch-to-workspace-9 = [ "<Super>9" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      screensaver = ["<Super>m"];
      custom-keybinds = true;
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0".binding = "<Super>q";
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0".command = "ghostty";
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0".name = "terminal";      
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybinds".custom0 = true;
  };

  home.activation.extraDconf = lib.mkAfter ''
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/cycle-group "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/cycle-group-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/cycle-panels "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/cycle-panels-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/cycle-windows "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/cycle-windows-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-down "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-left "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-right "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-up "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-last "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-left "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-right "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-down "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-up "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-applications "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-group "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-group-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-panels "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-panels-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-last "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-left "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-right "@as []"

    ${pkgs.dconf}/bin/dconf write /org/gnome/settings-daemon/plugins/media-keys/help "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/settings-daemon/plugins/media-keys/magnifier "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-in "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-out "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/settings-daemon/plugins/media-keys/screenreader "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/settings-daemon/plugins/media-keys/rotate-video-lock-static "@as []"

    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-1 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-10 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-2 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-3 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-4 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-5 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-6 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-7 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-8 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/switch-to-application-9 "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/shift-overview-down "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/keybindings/shift-overview-up "@as []"

    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/barf-out "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/barf-out-active "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/center-horizontally "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/center-vertically "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/cycle-height "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/cycle-height-backwards "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/cycle-width "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/drift-left "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/drift-right "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/live-alt-tab "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/live-alt-tab-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/live-alt-tab-scratch "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/live-alt-tab-scratch-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-down-workspace "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-monitor-above "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-monitor-below "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-monitor-left "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-monitor-right "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-previous-workspace "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-previous-workspace-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-space-monitor-above "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-space-monitor-below "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-space-monitor-left "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/move-up-workspace "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/new-window "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/new-window "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/paper-toggle-fullscreen "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/previous-workspace "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/previous-workspace-backward "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/slurp-in "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/swap-monitor-above "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/swap-monitor-below "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/swap-monitor-left "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/swap-monitor-right "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-down-workspace "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-first "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-focus-mode "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-last "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-monitor-above "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-monitor-below "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-monitor-left "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-monitor-right "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-next "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-open-window-position "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-previous "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/switch-up-workspace "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/take-window "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/toggle-maximize-width "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/toggle-scratch "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/toggle-scratch-layer "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/toggle-scratch-window "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/shell/extensions/paperwm/keybindings/toggle-top-and-position-bar "@as []"

    ${pkgs.dconf}/bin/dconf write /org/gnome/mutter/keybindings/cancel-input-capture "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/mutter/wayland/keybindings/restore-shortcuts "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/mutter/overlay-key "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/mutter/toggle-overview "@as []"
    ${pkgs.dconf}/bin/dconf write /org/gnome/mutter/overview-key "@as []"
  '';
}
