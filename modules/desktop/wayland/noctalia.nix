{
  flake.modules.homeManager.noctalia = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [inputs.noctalia.homeModules.default];

    home.packages = [
      pkgs.brightnessctl
      pkgs.cava
      pkgs.ddcutil
      pkgs.quickshell
      pkgs.wlsunset
    ];

    programs.noctalia-shell = {
      enable = true;
      systemd.enable = true;

      settings = {
        bar = {
          outerCorners = false;
          showCapsule = false;

          widgets = {
            left = [
              {
                id = "Workspace";
                hideUnoccupied = true;
              }
              {
                id = "ActiveWindow";
              }
            ];

            center = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Clock";
              }
            ];

            right = [
              {
                id = "Tray";
              }
              {
                id = "NotificationHistory";
              }
              {
                id = "SystemMonitor";
              }
              {
                id = "Battery";
                displayMode = "alwaysShow";
              }
            ];
          };
        };

        location = {
          name = "Aberdeen, United Kingdom";
          weatherShowEffects = false;
        };

        wallpaper.enabled = false;
        appLauncher.terminalCommand = "nu -c";

        controlCenter = {
          position = "top-center";

          shortcuts = {
            left = [
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "NoctaliaPerformance";
              }
            ];

            right = [
              {
                id = "PowerProfile";
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
            ];
          };

          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = true;
              id = "brightness-card";
            }
          ];
        };

        nightLight = {
          enabled = true;
          nightTemp = "2750";
          dayTemp = "4250";
        };
      };
    };
  };
}
