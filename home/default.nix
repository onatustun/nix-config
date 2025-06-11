{
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
    ./brave.nix
    ./direnv.nix
    ./eza.nix
    ./ff.nix
    ./fish
    ./ghostty.nix
    ./git.nix
    ./hypr 
    ./helix
    ./nh.nix
    ./pointer.nix
    ./rofi.nix
    ./starship.nix
    ./stylix
    ./tmux.nix
    ./waybar 
  ];

  xdg.userDirs.createDirectories = true;
    
  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    sessionVariables = {
      BROWSER = "brave";
      EDITOR = "hx";
      FLAKE = "/home/onat/nix";
      SHELL = "fish";
      VISUAL = "hx";
    };

    packages = with pkgs; [
      bottom
      fd
      fzf
      git
      nix-prefetch-git
      obsidian
      rar
      ripgrep
      swww
      typst
      unzip
      xfce.thunar
      yazi
      zip
      zmkBATx
      zoxide
    ];
  };
}
