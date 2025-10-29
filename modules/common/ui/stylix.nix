{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) genAttrs const;
in {
  stylix = rec {
    enable = true;

    base16Scheme = {
      name = "solarized_light";
      polarity = "light";
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

    polarity = base16Scheme.polarity;

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

  home-manager.sharedModules = [
    {
      stylix.targets =
        genAttrs [
          "helix"
          "nixcord"
          "rofi"
          "spicetify"
          "waybar"
          "zen-browser"
        ]
        <| const {enable = false;};
    }
  ];
}
