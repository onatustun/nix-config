{
  flake.modules.homeManager.cursor = {osConfig, ...}: {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
    };

    gtk = {
      enable = true;
      cursorTheme = osConfig.stylix.cursor;
    };
  };
}
