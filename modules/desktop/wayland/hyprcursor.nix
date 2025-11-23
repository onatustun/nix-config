{
  flake.modules.homeManager.hyprcursor = {
    self,
    inputs',
    pkgs,
    ...
  }: let
    bibata-hyprcursor = pkgs.callPackage (self + "/pkgs/bibata-hyprcursor.nix") {};
  in {
    home = {
      packages = [inputs'.hyprcursor.packages.default];

      pointerCursor.hyprcursor = {
        enable = true;
        size = 24;
      };
    };

    xdg.dataFile."icons/hypr_Bibata-Modern-Ice" = {
      source = "${bibata-hyprcursor}/share/icons/hypr_Bibata-Modern-Ice";
      recursive = true;
    };
  };
}
