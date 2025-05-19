{ 
  pkgs,
  ... 
}: let
  osaka= {
    name = "osaka";
    type = "dark";
    image = ./osaka.jpg;
    base00 = "#00141A";
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
  
  day = {
    name = "day";
    type = "light";
    image = ./day.png;
    base00 = "#D5D6DB";
    base01 = "#CBCCD1";
    base02 = "#DFE0E5";
    base03 = "#9699A3";
    base04 = "#4C505E";
    base05 = "#343B59";
    base06 = "#1A1B26";
    base07 = "#1A1B26";
    base08 = "#343B58";
    base09 = "#965027";
    base0A = "#166775";
    base0B = "#485E30";
    base0C = "#3E6968";
    base0D = "#34548A";
    base0E = "#5A4A78";
    base0F = "#8C4351";
  };

  current = day;
in {
  stylix = {
    enable = true;
    base16Scheme = current;
    polarity = current.type;
    image = current.image;

    targets = {
      helix.enable = false;
      rofi.enable = false;
      waybar.enable = false;
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

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
