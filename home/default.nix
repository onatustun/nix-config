{pkgs, ...}: {
  imports = [
    ./bat.nix
    ./brave.nix
    ./direnv.nix
    ./eza.nix
    ./ff.nix
    ./fish
    ./ghostty.nix
    ./git.nix
    ./helix
    ./hyprland
    ./nh.nix
    ./niri
    ./pointer.nix
    ./rofi.nix
    ./starship.nix
    ./stylix.nix
    ./swayidle.nix
    ./swaylock.nix
    ./tmux
    ./waybar
    ./wlogout.nix
    ./xdg.nix
    ./xwayland.nix
  ];

  services.cliphist.enable = true;

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
      appimage-run
      bottom
      brightnessctl
      cliphist
      dunst
      fd
      fzf
      gammastep
      git
      grim
      hyprcursor
      imv
      killall
      less
      mpv
      nix-search-cli
      nix-search-tv
      obsidian
      p7zip
      playerctl
      prettyping
      rar
      ripgrep
      skim
      slurp
      swayidle
      swaylock
      unzip
      wget
      wl-clipboard
      wl-clip-persist
      wlogout
      xdg-user-dirs
      xfce.thunar
      xwayland-satellite
      yazi
      zip
      zmkBATx
      zoxide
    ];
  };
}
