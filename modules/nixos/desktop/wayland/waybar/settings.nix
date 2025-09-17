{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.waybar = enabled {
        package = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.default;
        systemd = enabled;

        settings = [
          {
            layer = "top";
            position = "bottom";
            margin = "0 256 0";
            mode = "dock";

            modules-left = [
              "niri/workspaces"
              "hyprland/workspaces"
            ];

            modules-right = [
              "temperature"
              "disk"
              "memory"
              "cpu"
              "custom/keyboard"
              "wireplumber"
              "bluetooth"
              "network"
              "battery"
              "clock"
              "custom/power"
            ];

            "niri/workspaces" = {
              format = "{icon}";
              tooltip = false;
            };

            "hyprland/workspaces" = {
              format = "{icon}";
              tooltip = false;
            };

            temperature = {
              format = " ";
              tooltip = true;
              tooltip-format = "{temperatureC} °C";
            };

            disk = {
              format = " ";
              tooltip = true;
              tooltip-format = "{used}/{total}";
            };

            memory = {
              format = " ";
              tooltip = true;
              tooltip-format = "{used}/{total} {percentage}%";
            };

            cpu = {
              format = " ";
              tooltip = true;
              tooltip-format = "{usage}%";
            };

            "custom/keyboard" = {
              format = " ";
              tooltip = false;
              on-click = "pkill -SIGRTMIN -x wvkbd-mobintl";
            };

            wireplumber = {
              format = " ";
              tooltip = true;
              tooltip-format = "{volume}%";
              on-click-middle = "pwvucontrol";
              on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              scroll-step = 5;
              max-volume = 100.0;
            };

            bluetooth = {
              format = " ";
              on-click = "blueberry";
              tooltip = true;
              tooltip-format = "{status} {device_alias}";
            };

            network = {
              interval = 5;
              format = " ";
              on-click = "nm-connection-editor";
              tooltip = true;
              tooltip-format = "{ifname}:{ipaddr}/{cidr} {essid} ({signalStrength}%)";
            };

            battery = {
              interval = 60;
              format = " ";
              format-time = "{H}h{M}m";
              format-charging = " ";
              tooltip = true;
              tooltip-format = "{capacity}% {time}";

              states = {
                critical-empty = 5;
                critical = 5;
                empty = 10;
                p15 = 15;
                p25 = 25;
                p35 = 35;
                p45 = 45;
                half = 55;
                p65 = 65;
                p75 = 75;
                p85 = 85;
                full = 90;
                fu = 100;
              };
            };

            clock = {
              interval = 1;
              format = "{:%a %d %b %R}";
              tooltip = true;
              tooltip-format = "{:%a %b %d %m %Y %R}";
            };

            "custom/power" = {
              format = " ";
              tooltip = false;
              on-click = "wlogout -b 2 --protocol layer-shell";
            };
          }
        ];
      };
    }
  ];
}
