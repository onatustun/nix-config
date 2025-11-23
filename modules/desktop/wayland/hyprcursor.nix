{
  flake.modules.homeManager.hyprcursor = {
    pkgs,
    inputs',
    ...
  }: let
    bibata-hyprcursor = pkgs.callPackage (
      {stdenvNoCC, ...}:
        stdenvNoCC.mkDerivation {
          pname = "bibata-hyprcursor";
          version = "1.0";
          dontUnpack = true;

          src = builtins.fetchurl {
            url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Ice.tar.gz";
            sha256 = "sha256-3ttG6Hnr9TPtvIiIbQrsSodu5iZV4Y62xaKvQmkdLPg=";
          };

          installPhase = ''
            runHook preInstall

            mkdir -p $out/share/icons/hypr_Bibata-Modern-Ice
            cd $out/share/icons/hypr_Bibata-Modern-Ice
            tar -xzf $src --strip-components=1

            runHook postInstall
          '';
        }
    ) {};
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
