{isLaptop, ...}: {
  monitor =
    if isLaptop
    then [
      "eDP-1, 2256x1504@60, 0x0, 1.5667"
      "DP-3, 3840x2400, auto-down, 2.4"
    ]
    else [
      "DP-2, 1920x1080@240, 0x0, 1, transform, 2"
      "HDMI-A-1, 1920x1080@240, auto-down, 1"
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
    gaps_in = 4;
    gaps_out = 8;
    layout = "dwindle";
    resize_on_border = true;
  };

  decoration = {
    rounding = 4;
    active_opacity = 1;
    inactive_opacity = 1;
    shadow.enabled = true;
    blur.enabled = true;
  };

  animations = {
    enabled = true;
    first_launch_animation = true;

    bezier = [
      "ease,0.4,0.02,0.21,1"
    ];

    animation = [
      "windows, 1, 3.5, ease, slide"
      "windowsOut, 1, 3.5, ease, slide"
      "border, 1, 6, default"
      "fade, 1, 3, ease"
      "workspaces, 0, 0, default"
    ];
  };
}
