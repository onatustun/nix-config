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

  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    packages = with pkgs; [
      bat
      btop
      fzf
      ripgrep
      tree
      zoxide

      obsidian
    ];
  };
}
