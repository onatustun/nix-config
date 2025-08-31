{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled disabled genAttrs;

  gruber = {
    name = "gruber-darker";
    polarity = "dark";
    base00 = "#181818";
    base01 = "#453d41";
    base02 = "#484848";
    base03 = "#52494e";
    base04 = "#e4e4ef";
    base05 = "#f4f4ff";
    base06 = "#f5f5f5";
    base07 = "#e4e4ef";
    base08 = "#f43841";
    base09 = "#c73c3f";
    base0A = "#ffdd33";
    base0B = "#73c936";
    base0C = "#95a99f";
    base0D = "#96a6c8";
    base0E = "#9e95c7";
    base0F = "#cc8c3c";
  };
in {
  stylix = enabled {
    base16Scheme = gruber;
    inherit (gruber) polarity;

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
      stylix.targets = genAttrs [
        "helix"
        "nixcord"
        "rofi"
        "spicetify"
        "waybar"
        "zen-browser"
      ] (_: disabled);
    }
  ];
}
