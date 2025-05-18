{
  config,
  ...
}: {
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;
      preload = [ (toString "${config.stylix.image}" ) ];
      wallpaper = [ 
        "eDP-1, ${toString "${config.stylix.image}"}" 
        "DP-2, ${toString "${config.stylix.image}"}" 
      ];
    };
  };
}
