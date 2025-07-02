{
  pkgs,
  username,
  ...
}: {
  services.cliphist.enable = true;
  programs.home-manager.enable = true;

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  home = {
    username = username;
    sessionVariables.FLAKE = "/home/${username}/nix";
    homeDirectory =
      if pkgs.stdenv.isLinux
      then "/home/${username}"
      else "/Users/${username}";

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
