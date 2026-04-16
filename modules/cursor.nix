{
  flake.modules.homeManager.cursor =
    { config, ... }:
    {
      home.pointerCursor = {
        enable = true;
        gtk.enable = true;
      };

      gtk = {
        enable = true;
        cursorTheme = config.stylix.cursor;
      };
    };
}
