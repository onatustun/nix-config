{
  plugin.scroller = {
    center_row_if_space_available = true;
  };

  general = {
    gaps_in = 8;
    gaps_out = 16;
    border_size = 0;
    layout = "scroller";
   };

  decoration = {
    rounding = 8;
    active_opacity = 1.0;
    inactive_opacity = 0.8;

    blur = {
      enabled = true;
      size = 8;
      passes = 3;
      new_optimizations = "on";
      noise = 0.01;
      contrast = 0.9;
      brightness = 0.8;
    };
  };

  animations = {
    enabled = "yes";
    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
    animation = [
      "windows, 1, 5, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
    ];
  };

  misc = {
    force_default_wallpaper = 0;
    disable_hyprland_logo = true;
  };
}
