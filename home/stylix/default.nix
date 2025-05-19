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
  
  ayu = {
    name = "ayu";
    type = "light";
    image = ./ayu.png;
    base00 = "#FAFAFA";
    base01 = "#F3F4F5";
    base02 = "#F8F9FA";
    base03 = "#ABB0B6";
    base04 = "#828C99";
    base05 = "#5C6773";
    base06 = "#242936";
    base07 = "#1A1F29";
    base08 = "#F07178";
    base09 = "#FA8D3E";
    base0A = "#F2AE49";
    base0B = "#86B300";
    base0C = "#4CBF99";
    base0D = "#36A3D9";
    base0E = "#A37ACC";
    base0F = "#E6BA7E";
  };

  current = ayu;
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
