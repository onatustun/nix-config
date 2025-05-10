{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./brave.nix
    ./direnv.nix
    ./eza.nix
    ./ff.nix
    ./fish
    ./ghostty.nix
    ./git.nix
    ./hypr 
    ./nvf.nix
    ./pointer.nix
    ./rofi.nix
    ./starship.nix
    ./stylix.nix
    ./tmux.nix
    ./waybar 
    inputs.nvf.homeManagerModules.default
  ];

  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    sessionVariables = {
      BROWSER = "brave";
      EDITOR = "nvim";
      SHELL = "fish";
      TERM = "ghostty";
      VISUAL = "nvim";
    };

    packages = with pkgs; [
      bat
      bottom
      fd
      fzf
      nix-prefetch-git
      obsidian
      ripgrep
      xfce.thunar
      yazi
      zoxide
    ];
  };
}
