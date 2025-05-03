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
    ./ghostty.nix
    ./git.nix
    ./hypr 
    ./nvf.nix
    ./omp.nix
    ./pointer.nix
    ./rofi.nix
    ./stylix.nix
    ./tmux.nix
    ./waybar 
    ./zsh
    inputs.nvf.homeManagerModules.default
  ];

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
  };
}
