{
  flake = {
    nixosModules.desktop = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.homeModules.cursor;
    };

    homeModules.cursor = {osConfig, ...}: {
      home.pointerCursor = {
        enable = true;
        gtk.enable = true;
      };

      gtk = {
        enable = true;
        cursorTheme = osConfig.stylix.cursor;
      };
    };
  };
}
