{
  monitor = [
    # "eDP-1,2256x1504,auto,1.6"
    # "DP-3,3840x2400,auto-down,2.4"
    "HDMI-A-1,1920x1080@240,auto-left, 1"
    "DP-4,1920x1080@240,auto,1"
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
    rounding = 6;
    active_opacity = 1;
    inactive_opacity = 0.9;
    shadow.enabled = false;

    blur = {
      brightness = 1;
      contrast = 1;
      enabled = true;
      new_optimizations = true;
      noise = 0.05;
      passes = 3;
      size = 8;
      vibrancy = 1;
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
