{ inputs, ... }:
{
  flake =
    { config, ... }:
    {
      modules = {
        nixos.noctalia =
          { lib, ... }:
          let
            inherit (lib.lists) singleton;
          in
          {
            nix.settings = {
              extra-substituters = [ "https://noctalia.cachix.org" ];
              extra-trusted-public-keys = singleton "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=";
            };

            home-manager.sharedModules = [ config.modules.homeManager.noctalia ];
          };

        homeManager.noctalia =
          {
            lib,
            pkgs,
            config,
            ...
          }:
          let
            inherit (lib.attrsets) attrValues;
            inherit (lib.lists) singleton;
          in
          {
            imports = [ inputs.noctalia.homeModules.default ];

            home.packages = attrValues {
              inherit (pkgs)
                brightnessctl
                cava
                ddcutil
                quickshell
                wlsunset
                ;
            };

            programs.noctalia-shell = {
              enable = true;
              systemd.enable = true;

              settings = {
                bar = {
                  outerCorners = false;
                  showCapsule = false;

                  widgets = {
                    left = singleton {
                      id = "Workspace";
                      hideUnoccupied = true;
                    };

                    center = [
                      {
                        id = "ControlCenter";
                        useDistroLogo = true;
                      }
                      { id = "Clock"; }
                    ];

                    right = [
                      { id = "Tray"; }
                      { id = "NotificationHistory"; }
                      { id = "SystemMonitor"; }
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
                appLauncher.terminalCommand = "${config.home.sessionVariables.SHELL} -c";

                controlCenter = {
                  position = "top-center";

                  shortcuts = {
                    left = [
                      { id = "Network"; }
                      { id = "Bluetooth"; }
                      { id = "NoctaliaPerformance"; }
                    ];

                    right = [
                      { id = "PowerProfile"; }
                      { id = "KeepAwake"; }
                      { id = "NightLight"; }
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
    };
}
