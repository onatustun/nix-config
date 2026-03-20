{
  flake = {
    nixosModules.desktop = {
      lib,
      inputs,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.cursor;
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
