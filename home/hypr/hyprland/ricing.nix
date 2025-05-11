{
  monitor = [
    "eDP-1,2256x1504,auto,1.333667"
    "DP-2,3840x2400,auto-down,2.4"
  ];

  plugin.scroller.center_row_if_space_available = true;

  general = {
    border_size = 2;
    gaps_in = 8;
    gaps_out = 16;
    layout = "scroller";
    resize_on_border = true;
   };

  decoration = {
    rounding = 2;
    active_opacity = 1.0;
    inactive_opacity = 0.8;
    shadow.enabled = false;

    blur = {
      enabled = true;
      brightness = 0.8;
      contrast = 0.9;
      new_optimizations = 1;
      noise = 0.01;
      passes = 3;
      size = 8;
    };
  };

  animations = {
    enabled = "yes";
    first_launch_animation = true;
    bezier = "myBezier, 0.25, 0.9, 0.1, 1.02";
    animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "fade, 1, 8, default"
      "workspaces, 0, 7, default"
    ];
  };
}
