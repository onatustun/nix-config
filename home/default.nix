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
    ./stylix.nix
    ./tmux.nix
    ./waybar 
    ./zsh
    inputs.nvf.homeManagerModules.default
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    packages = with pkgs; [
      bat
      bottom
      fzf
      ripgrep
      ranger
      xfce.thunar
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
