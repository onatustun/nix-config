let
  wallpaperPath = ./wallpaper.jpg;
  monitorID = "eDP-1";
in {
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;
      preload = [ (toString wallpaperPath) ];
      wallpaper = [ "${monitorID}, ${toString wallpaperPath}" ];
    };
  };
}
