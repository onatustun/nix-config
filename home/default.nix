{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules
    inputs.nvf.homeManagerModules.default
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    packages = with pkgs; [
      bat
      brightnessctl
      btop
      discord
      dunst
      fzf
      hyprshot
      hyprsunset
      imv
      mpv
      obs-studio
      obsidian
      obsidian
      pavucontrol
      ripgrep
      tree
      vscode
      wl-clipboard
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      zoxide
    ];
  };

  programs = {
    home-manager.enable = true;
    zoxide.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  programs.plasma = {
    enable = true;
    
    # General workspace appearance and behavior
    workspace = {
      theme = "Breeze";
      colorScheme = "BreezeDark";
      iconTheme = "Papirus-Dark";
      cursorTheme = "Breeze_Snow";
      wallpaper = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Flow/contents/images/3840x2160.jpg";
      clickItemTo = "select";
      lookAndFeel = "org.kde.breezedark.desktop";
      titlebarButtons = {
        left = [ "close" "maximize" "minimize" ];
        right = [];
      };
    };

    # Configure the top panel
    panels = [
      {
        location = "top";
        height = 36;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                favoritesDisplay = "grid";
                alphaSort = true;
                showAppsByName = true;
              };
            };
          }
          "org.kde.plasma.pager"
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [
                  "applications:org.kde.dolphin.desktop"
                  "applications:firefox.desktop"
                  "applications:org.kde.konsole.desktop"
                  "applications:systemsettings.desktop"
                ];
                groupingStrategy = "1"; # By program
                showOnlyCurrentDesktop = false;
                sortingStrategy = "1"; # By launch time
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
      }
    ];

    # Configure virtual desktops
    desktops = {
      enable = true;
      rows = 2;
      desktops = [
        {
          name = "Main";
          wallpaper = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Flow/contents/images/3840x2160.jpg";
        }
        {
          name = "Work";
          wallpaper = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Kay/contents/images/3840x2160.jpg";
        }
        {
          name = "Media";
          wallpaper = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Network/contents/images/3840x2160.jpg";
        }
        {
          name = "Misc";
          wallpaper = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Cluster/contents/images/3840x2160.jpg";
        }
      ];
    };

    # Configure shortcuts
    shortcuts = {
      "kwin"."Switch to Desktop 1" = "Meta+1";
      "kwin"."Switch to Desktop 2" = "Meta+2";
      "kwin"."Switch to Desktop 3" = "Meta+3";
      "kwin"."Switch to Desktop 4" = "Meta+4";
      "kwin"."Window Close" = "Alt+F4";
      "kwin"."Window Maximize" = "Meta+PgUp";
      "kwin"."Window Minimize" = "Meta+PgDown";
      "kwin"."Window Quick Tile Left" = "Meta+Left";
      "kwin"."Window Quick Tile Right" = "Meta+Right";
      "org.kde.konsole.desktop"."_launch" = "Meta+Return";
      "org.kde.dolphin.desktop"."_launch" = "Meta+E";
    };

    # Configure KWin
    kwin = {
      decorations = {
        theme = "Breeze";
        titlebarButtons = {
          left = [ "close" "maximize" "minimize" ];
          right = [];
        };
      };
      effects = {
        blurEnabled = true;
        wobblywindowsEnabled = false;
        magicLampEnabled = true;
      };
      windowSwitcher = {
        showDesktopIcon = true;
        layoutName = "org.kde.breeze.desktop";
      };
    };

    # Configure Dolphin
    configFile = {
      "dolphinrc" = {
        "General" = {
          "RememberOpenedTabs" = true;
          "ShowFullPath" = true;
          "ShowZoomSlider" = true;
          "Version" = 202;
        };
        "MainWindow" = {
          "ToolBarsMovable" = false;
        };
        "PreviewSettings" = {
          "Plugins" = "appimagethumbnail,audiothumbnail,blenderthumbnail,comicbookthumbnail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,fontthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,mobithumbnail,opendocumentthumbnail,gsthumbnail,rawthumbnail,svgthumbnail,ffmpegthumbs";
        };
      };
    };

    # Configure Konsole
    spectacle = {
      shortcuts = {
        captureActiveWindow = "Meta+Print";
        captureCurrentMonitor = "Print";
        captureRectangularRegion = "Meta+Shift+Print";
      };
    };
  };
}
