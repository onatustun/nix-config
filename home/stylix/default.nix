{
  lib, 
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

  light = {
    name = "light";
    type = "light";
    image = ./light.jpg;
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

  current = light;
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

  services.swww.enable = true;

  home.activation = {
    reload-swww = let
      swww = "${pkgs.swww}/bin/swww";
    in
      lib.hm.dag.entryAfter ["writeBoundary"]

      ''
        run --quiet ${swww} img -o eDP-1 "/home/onat/nix/home/stylix/${current.name}" \
        && run --quiet ${swww} img -o DP-2 "/home/onat/nix/home/stylix/${current.name}"
      '';
  };
}
