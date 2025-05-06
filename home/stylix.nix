{ 
  pkgs,
  ... 
}: let
  nord = {
    dark = {
      base00 = "#2E3440";
      base01 = "#3B4252";
      base02 = "#434C5E";
      base03 = "#4C566A";
      base04 = "#D8DEE9";
      base05 = "#E5E9F0";
      base06 = "#ECEFF4";
      base07 = "#8FBCBB";
      base08 = "#BF616A";
      base09 = "#D08770";
      base0A = "#EBCB8B";
      base0B = "#A3BE8C";
      base0C = "#88C0D0";
      base0D = "#81A1C1";
      base0E = "#B48EAD";
      base0F = "#5E81AC";
    };

    light = {
      base00 = "#e5e9f0";
      base01 = "#c2d0e7";
      base02 = "#b8c5db";
      base03 = "#aebacf";
      base04 = "#60728c";
      base05 = "#2e3440";
      base06 = "#3b4252";
      base07 = "#29838d";
      base08 = "#99324b";
      base09 = "#ac4426";
      base0A = "#9a7500";
      base0B = "#4f894c";
      base0C = "#398eac";
      base0D = "#3b6ea8";
      base0E = "#97365b";
      base0F = "#5272af";
    };
  };

  gruvbox = {
    dark = {
      base00 = "#282828";
      base01 = "#3c3836";
      base02 = "#504945";
      base03 = "#665c54";
      base04 = "#bdae93";
      base05 = "#d5c4a1";
      base06 = "#ebdbb2";
      base07 = "#fbf1c7";
      base08 = "#fb4934";
      base09 = "#fe8019";
      base0A = "#fabd2f";
      base0B = "#b8bb26";
      base0C = "#8ec07c";
      base0D = "#83a598";
      base0E = "#d3869b";
      base0F = "#d65d0e";
    };

    light = {
      base00 = "#fbf1c7";
      base01 = "#ebdbb2";
      base02 = "#d5c4a1";
      base03 = "#bdae93";
      base04 = "#665c54";
      base05 = "#504945";
      base06 = "#3c3836";
      base07 = "#282828";
      base08 = "#9d0006";
      base09 = "#af3a03";
      base0A = "#b57614";
      base0B = "#79740e";
      base0C = "#427b58";
      base0D = "#076678";
      base0E = "#8f3f71";
      base0F = "#d65d0e";
    };
  };

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

    light = {
      base00 = "#fdf6e3";
      base01 = "#eee8d5";
      base02 = "#93a1a1";
      base03 = "#839496";
      base04 = "#657b83";
      base05 = "#586e75";
      base06 = "#073642";
      base07 = "#002b36";
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

    targets = {
      waybar.enable = false;
      rofi.enable = false;
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
