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
    ./hypr
    ./nh.nix
    ./niri
    ./pointer.nix
    ./rofi.nix
    ./starship.nix
    ./stylix.nix
    ./tmux
    ./waybar
  ];

  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "Xwayland outside your Wayland";
      BindsTo = "graphical-session.target";
      PartOf = "graphical-session.target";
      After = "graphical-session.target";
      Requisite = "graphical-session.target";
    };

    Service = {
      Type = "notify";
      NotifyAccess = "all";
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      StandardOutput = "journal";
    };

    Install.WantedBy = ["niri.service"];
  };

  xdg = {
    enable = true;
    userDirs.createDirectories = true;
    mime.enable = true;

    mimeApps = {
      enable = true;

      defaultApplications = {
        "inode/directory" = "thunar.desktop";
        "text/plain" = "helix.desktop";
      };
    };
  };

  services.cliphist.enable = true;

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

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
      brightnessctl
      cliphist
      dunst
      fd
      fzf
      git
      hyprcursor
      hyprsunset
      less
      nix-prefetch-git
      nix-search-cli
      nix-search-tv
      obsidian
      playerctl
      prettyping
      rar
      ripgrep
      unzip
      tmux-sessionizer
      wl-clipboard
      wl-clip-persist
      xdg-user-dirs
      xfce.thunar
      xwayland-satellite
      yazi
      zip
      zmkBATx
      zoxide
      skim
    ];
  };
}
