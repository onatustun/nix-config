{pkgs, ...}: {
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
    source = "${pkgs.bibata-hyprcursor}/share/icons/hypr_Bibata-Modern-Ice";
    recursive = true;
  };
}
