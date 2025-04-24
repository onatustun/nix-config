{ 
  monitor = ",preferred,auto,1.333667";

  plugin = {
    scroller = {
      center_row_if_space_available = true;
    };

    hyprexpo = {
      columns = 3;
      enable_gesture = true;
      gesture_fingers = 3;
      gesture_distance = 300;
      gesture_positive = true;
    };
  };

  general = {
    border_size = 0;
    gaps_in = 8;
    gaps_out = 16;
    layout = "scroller";
    resize_on_border = true;
   };

  decoration = {
    rounding = 6;
    active_opacity = 1.0;
    inactive_opacity = 0.8;
    shadow.enabled = false;

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
    bezier = "myBezier, 0.25, 0.9, 0.1, 1.02";
    animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "fade, 1, 8, default"
      "workspaces, 1, 7, default"
    ];
  };
}
