{
  config,
  pkgs,
  lib,
  ...
}: let
  icons = import ./icons.nix { inherit
    pkgs
    lib
    config;
  };

  iconsPath = "${icons.waybarIconsDir}";

  style = import ./style.nix { inherit
    iconsPath
    config;
  };
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = style;

    settings = [{
      layer = "top";
      position = "bottom";
      margin = "0 128 8";
      mode = "dock";

      modules-left = [ 
        "hyprland/workspaces" 
        "wlr/taskbar"
      ];

      modules-right = [
        "tray"
        "bluetooth"
        "network"
        "wireplumber"
        "battery"
        "clock"
      ];

      "hyprland/workspaces" = {
        format = "{icon}";
        tooltip = false;
      };

      "wlr/taskbar" = {
        format = "{icon}";
        icon-size = 16;
        tooltip = true;
        tooltip-format = "{name}";
      };

      tray = {
        icon-size = 16;
        spacing = 4;
      };
      
      bluetooth = {
        format = " ";
        format-connected-battery = " ";
        format-disabled = "";
        format-off = "";
        format-no-controller = "";
        tooltip = true;
        on-click = "blueman-manager";
        tooltip-format-connected = "{status}";
        tooltip-format-connected-battery = "{status} {device_battery_percentage}%";
      };

      network = {
        interval = 5;
        format = " ";
        format-disabled = "";
        format-disconnected = "";
        tooltip = true;
        tooltip-format = "{ifname}:{ipaddr}/{cidr} {essid} ({signalStrength}%)";
      };

      wireplumber = {
        format = " ";
        format-muted = "";
        tooltip = true;
        tooltip-format = "{volume}%";
        on-click = "pavucontrol";
      };

      battery = {
        interval = 5;
        format = " ";
        format-time = "{H}h{M}m";
        tooltip = true;
        tooltip-format = "{capacity}% {time}";

        states = {
          full = 100;
          high = 80;
          medium = 60;
          low = 40;
          empty = 20;
        };
      };

      clock = {
        interval = 1;
        format = "{:%H:%M}";
        tooltip = true;
        tooltip-format = "{:%a %d %b}";
      };
    }];
  };
}
