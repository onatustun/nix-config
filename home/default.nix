{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./brave.nix
    ./eza.nix
    ./ff.nix
    ./ghostty.nix
    ./git.nix
    ./hypr 
    ./nvf.nix
    ./omp.nix
    ./rofi.nix
    ./tmux.nix
    ./waybar 
    ./zsh
    inputs.nvf.homeManagerModules.default
  ];

  stylix = {
    enable = true;
    targets.waybar.enable = false;
    base16Scheme = {
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


  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    packages = with pkgs; [
      bat
      fzf
      ripgrep
      tree
      zoxide
      obsidian
    ];

    pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;

      hyprcursor = {
        enable = true;
        size = 24;
      };
    };
  };

  gtk = {
    enable = true;

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
