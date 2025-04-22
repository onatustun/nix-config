let
  solarized = {
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

  gruvbox = {
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
in {
  stylix = {
    base16Scheme = gruvbox;
    enable = true;
    targets.waybar.enable = false;
  };
}
