{
  dconf = {
    enable = true;

    settings = {
      "org/gnome/mutter" = {
        dynamic-workspaces = false;
        edge-tiling = false;
      };

      "org/gnome/desktop/interface" = {
        clock-format = "24h"; 
        clock-show-date = true;
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };

      "org/gnome/desktop/datetime".automatic-timezone = true;
      "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
      "org/gnome/settings-daemon/plugins/power".power-button-action = "interactive";
      "org/gnome/shell".last-selected-power-profile = "power-saver";
    };
  };
}
