{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled disabled genAttrs;

  # latte = {
  #   name = "latte";
  #   polarity = "light";
  #   base00 = "#eff1f5";
  #   base01 = "#e6e9ef";
  #   base02 = "#ccd0da";
  #   base03 = "#bcc0cc";
  #   base04 = "#acb0be";
  #   base05 = "#4c4f69";
  #   base06 = "#dc8a78";
  #   base07 = "#7287fd";
  #   base08 = "#d20f39";
  #   base09 = "#fe640b";
  #   base0A = "#df8e1d";
  #   base0B = "#40a02b";
  #   base0C = "#179299";
  #   base0D = "#1e66f5";
  #   base0E = "#8839ef";
  #   base0F = "#dd7878";
  # };

  gruvbox = {
    name = "gruvbox";
    polarity = "dark";
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

  current = gruvbox;
in {
  stylix = enabled {
    base16Scheme = current;
    inherit (current) polarity;

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
