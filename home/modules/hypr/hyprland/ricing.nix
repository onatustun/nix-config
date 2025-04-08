{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 12;
      gaps_out = 24;
      border_size = 0;
      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
     };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    decoration = {
      rounding = 18;
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      shadow.enabled = false;
      blur.enabled = false;
    };

    animations.enabled = false;

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };
  };
}
