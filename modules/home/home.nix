{pkgs, ...}: {
  services.cliphist.enable = true;
  programs.home-manager.enable = true;

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  home = {
    username = "onat";
    stateVersion = "24.11";
    homeDirectory =
      if pkgs.stdenv.isLinux
      then "/home/onat"
      else "/Users/onat";

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
