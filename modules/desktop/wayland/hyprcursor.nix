{
  flake.modules.homeManager.hyprcursor = {pkgs, ...}: {
    home.pointerCursor.hyprcursor = {
      enable = true;
      size = 24;
    };

    xdg.dataFile."icons/hypr_Bibata-Modern-Ice" = {
      source = "${pkgs.bibata-hyprcursor}/share/icons/hypr_Bibata-Modern-Ice";
      recursive = true;
    };
  };
}
