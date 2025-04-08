let 
  wallpaper = "./wallpaper.jpg";
in{
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;
      preload = [wallpaper];
      wallpaper = [wallpaper];
    };
  };
}
