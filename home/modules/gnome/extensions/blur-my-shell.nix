{
  dconf.settings = {
    "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.75;
      noise-amount = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      blur-on-overview = false;
      brightness = 1;
      dynamic-opacity = true;
      enable-all = true;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      brightness = 0.9;
      sigma = 0;
      override-background = true;
      static-blur = false;
      style-panel = 0;
    };
  };
}
