{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      home.pointerCursor = {
        gtk = enabled;
        hyprcursor = enabled {size = 24;};
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      gtk = enabled {
        cursorTheme = {
          name = "Bibata-Modern-Ice";
          package = pkgs.bibata-cursors;
          size = 24;
        };
      };

      xdg.dataFile."icons/hypr_Bibata-Modern-Ice" = {
        source = "${pkgs.bibata-hyprcursor}/share/icons/hypr_Bibata-Modern-Ice";
        recursive = true;
      };
    }
  ];
}
