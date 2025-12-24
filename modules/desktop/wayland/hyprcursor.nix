{
  flake.modules.homeManager.hyprcursor = {
    pkgs,
    inputs',
    ...
  }: let
    bibata-hyprcursor = pkgs.stdenvNoCC.mkDerivation {
      pname = "bibata-hyprcursor";
      version = "1.0";
      dontUnpack = true;

      src = pkgs.fetchurl {
        url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Ice.tar.gz";
        sha256 = "sha256-3ttG6Hnr9TPtvIiIbQrsSodu5iZV4Y62xaKvQmkdLPg=";
      };

      installPhase = ''
        mkdir -p $out/share/icons/hypr_Bibata-Modern-Ice
        tar -xzf $src -C $out/share/icons/hypr_Bibata-Modern-Ice \
          --strip-components=1
      '';
    };
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
