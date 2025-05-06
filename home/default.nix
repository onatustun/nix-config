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
    ./fish.nix
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
    inputs.nvf.homeManagerModules.default
  ];

  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "brave";
    };

    packages = with pkgs; [
      bat
      bottom
      fd
      fzf
      obsidian
      ripgrep
      xfce.thunar
      yazi
      zoxide
    ];
  };
}
