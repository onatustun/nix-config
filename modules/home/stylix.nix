{
  pkgs,
  inputs,
  ...
}: let
  dark = {
    scheme = "Custom Dark";
    author = "Your Name";
    polarity = "dark";
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

  light = {
    scheme = "Custom Light";
    author = "Your Name";
    polarity = "light";
    base00 = "#eff1f5";
    base01 = "#e6e9ef";
    base02 = "#ccd0da";
    base03 = "#bcc0cc";
    base04 = "#acb0be";
    base05 = "#4c4f69";
    base06 = "#dc8a78";
    base07 = "#7287fd";
    base08 = "#d20f39";
    base09 = "#fe640b";
    base0A = "#df8e1d";
    base0B = "#40a02b";
    base0C = "#179299";
    base0D = "#1e66f5";
    base0E = "#8839ef";
    base0F = "#dd7878";
  };

  current = dark;
in {
  imports = [inputs.stylix.homeModules.stylix];

  stylix = {
    enable = true;
    base16Scheme = current;
    polarity = current.polarity;

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
