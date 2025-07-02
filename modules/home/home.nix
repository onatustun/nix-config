{
  homeDir,
  pkgs,
  username,
  ...
}: {
  services.cliphist.enable = true;
  programs.home-manager.enable = true;

  home = {
    username = username;
    homeDirectory = homeDir;
    sessionVariables.FLAKE = "${homeDir}/nix";

    packages = with pkgs; [
      appimage-run
      bottom
      brightnessctl
      cliphist
      dconf
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
      polkit
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
      xwayland
      xwayland-satellite
      yazi
      zip
      zmkBATx
      zoxide
    ];
  };
}
