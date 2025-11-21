{
  flake.modules.homeManager.hyprcursor = {
    inputs',
    pkgs,
    ...
  }: {
    home = {
      packages = [inputs'.hyprcursor.packages.default];

      pointerCursor.hyprcursor = {
        enable = true;
        size = 24;
      };
    };

    xdg.dataFile."icons/hypr_Bibata-Modern-Ice" = {
      source = "${pkgs.bibata-hyprcursor}/share/icons/hypr_Bibata-Modern-Ice";
      recursive = true;
    };
  };
}
