let
  wallpaperPath = ./wallpaper.jpg;
in {
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;
      preload = [ (toString wallpaperPath) ];
      wallpaper = [ 
        "eDP-1, ${toString wallpaperPath}" 
      ];
    };
  };
}
