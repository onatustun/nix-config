{ 
  pkgs,
  ... 
}: let
  solarized = {
    dark = {
      base00 = "#002b36";
      base01 = "#073642";
      base02 = "#586e75";
      base03 = "#657b83";
      base04 = "#839496";
      base05 = "#93a1a1";
      base06 = "#eee8d5";
      base07 = "#fdf6e3";
      base08 = "#dc322f";
      base09 = "#cb4b16";
      base0A = "#b58900";
      base0B = "#859900";
      base0C = "#2aa198";
      base0D = "#268bd2";
      base0E = "#6c71c4";
      base0F = "#d33682";
    };
  };
in {
  stylix = {
    enable = true;
    base16Scheme = solarized.dark;
    polarity = "dark";

    targets = {
      waybar.enable = false;
      rofi.enable = false;
      helix.enable = false;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}
