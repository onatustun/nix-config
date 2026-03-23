{
  flake = {
    nixosModules.noctalia = {
      lib,
      inputs,
      ...
    }: {
      nix.settings = {
        extra-substituters = lib.lists.singleton "https://noctalia.cachix.org";
        extra-trusted-public-keys = lib.lists.singleton "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=";
      };

      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.noctalia;
    };

    homeModules.noctalia = {
      lib,
      inputs,
      pkgs,
      ...
    }: {
      imports = lib.lists.singleton inputs.noctalia.homeModules.default;

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
  };
}
