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
    ./helix.nix 
    ./nh.nix
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
      EDITOR = "hx";
      FLAKE = "/home/onat/nix";
      SHELL = "fish";
      TERM = "ghostty";
      VISUAL = "hx";
    };

    packages = with pkgs; [
      bat
      bottom
      fd
      fzf
      git
      networkmanagerapplet
      nix-prefetch-git
      obsidian
      rar
      ripgrep
      unzip
      xfce.thunar
      yazi
      zip
      zmkBATx
      zoxide
    ];
  };
}
