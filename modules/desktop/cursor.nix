{
  flake.modules = {
    nixos.desktop = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.cursor;
    };

    homeManager.cursor = {osConfig, ...}: {
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
