{
  pkgs,
  lib,
  ...
}: {
  home-manager.sharedModules = let
    inherit (lib) enabled;
  in [
    {
      home.pointerCursor = {
        gtk.enable = true;
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
        hyprcursor = enabled {size = 24;};
      };

      gtk = enabled {
        cursorTheme = {
          name = "Bibata-Modern-Ice";
          package = pkgs.bibata-cursors;
          size = 24;
        };
      };

      home.file.".local/share/icons/hypr_Bibata-Modern-Ice" = {
        source = "${pkgs.bibata-hyprcursor}/share/icons/hypr_Bibata-Modern-Ice";
        recursive = true;
      };
    }
  ];
}
