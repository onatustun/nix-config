{pkgs, ...}: let
  bibataHyprcursor = pkgs.fetchurl {
    url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Ice.tar.gz";
    sha256 = "sha256-3ttG6Hnr9TPtvIiIbQrsSodu5iZV4Y62xaKvQmkdLPg=";
  };
in {
  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;

    hyprcursor = {
      enable = true;
      size = 24;
    };
  };

  gtk = {
    enable = true;

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.file.".local/share/icons/hypr_Bibata-Modern-Ice" = {
    source = pkgs.runCommand "bibata-hyprcursor" {} ''
      mkdir -p $out
      cd $out
      ${pkgs.gnutar}/bin/tar -xzf ${bibataHyprcursor} --strip-components=1
    '';
    recursive = true;
  };
}
