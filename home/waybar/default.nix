{ 
  config, 
  pkgs, 
  lib, 
  ... 
}: let
  myWaybarIcons = {
    "battery/charging" = "M150.81,131.79a8,8,0,0,1,.35,7.79l-16,32a8,8,0,0,1-14.32-7.16L131.06,144H112a8,8,0,0,1-7.16-11.58l16-32a8,8,0,1,1,14.32,7.16L124.94,128H144A8,8,0,0,1,150.81,131.79ZM96,16h64a8,8,0,0,0,0-16H96a8,8,0,0,0,0,16ZM200,56V224a24,24,0,0,1-24,24H80a24,24,0,0,1-24-24V56A24,24,0,0,1,80,32h96A24,24,0,0,1,200,56Zm-16,0a8,8,0,0,0-8-8H80a8,8,0,0,0-8,8V224a8,8,0,0,0,8,8h96a8,8,0,0,0,8-8Z";

    "battery/high" = "M88,8a8,8,0,0,1,8-8h64a8,8,0,0,1,0,16H96A8,8,0,0,1,88,8Zm72,96H96a8,8,0,0,0-8,8v96a8,8,0,0,0,8,8h64a8,8,0,0,0,8-8V112A8,8,0,0,0,160,104Zm40-48V224a24,24,0,0,1-24,24H80a24,24,0,0,1-24-24V56A24,24,0,0,1,80,32h96A24,24,0,0,1,200,56Zm-16,0a8,8,0,0,0-8-8H80a8,8,0,0,0-8,8V224a8,8,0,0,0,8,8h96a8,8,0,0,0,8-8Z";

    "battery/default" = "M88,8a8,8,0,0,1,8-8h64a8,8,0,0,1,0,16H96A8,8,0,0,1,88,8ZM200,56V224a24,24,0,0,1-24,24H80a24,24,0,0,1-24-24V56A24,24,0,0,1,80,32h96A24,24,0,0,1,200,56Zm-16,0a8,8,0,0,0-8-8H80a8,8,0,0,0-8,8V224a8,8,0,0,0,8,8h96a8,8,0,0,0,8-8Zm-24,88H96a8,8,0,0,0-8,8v56a8,8,0,0,0,8,8h64a8,8,0,0,0,8-8V152A8,8,0,0,0,160,144Z";

    "battery/empty" = "M88,8a8,8,0,0,1,8-8h64a8,8,0,0,1,0,16H96A8,8,0,0,1,88,8ZM200,56V224a24,24,0,0,1-24,24H80a24,24,0,0,1-24-24V56A24,24,0,0,1,80,32h96A24,24,0,0,1,200,56Zm-16,0a8,8,0,0,0-8-8H80a8,8,0,0,0-8,8V224a8,8,0,0,0,8,8h96a8,8,0,0,0,8-8Z";


    "battery/full" = "M88,8a8,8,0,0,1,8-8h64a8,8,0,0,1,0,16H96A8,8,0,0,1,88,8ZM200,56V224a24,24,0,0,1-24,24H80a24,24,0,0,1-24-24V56A24,24,0,0,1,80,32h96A24,24,0,0,1,200,56Zm-16,0a8,8,0,0,0-8-8H80a8,8,0,0,0-8,8V224a8,8,0,0,0,8,8h96a8,8,0,0,0,8-8Zm-24,8H96a8,8,0,0,0-8,8V208a8,8,0,0,0,8,8h64a8,8,0,0,0,8-8V72A8,8,0,0,0,160,64Z";
    
    "battery/low" = "M88,8a8,8,0,0,1,8-8h64a8,8,0,0,1,0,16H96A8,8,0,0,1,88,8Zm72,176H96a8,8,0,0,0-8,8v16a8,8,0,0,0,8,8h64a8,8,0,0,0,8-8V192A8,8,0,0,0,160,184ZM200,56V224a24,24,0,0,1-24,24H80a24,24,0,0,1-24-24V56A24,24,0,0,1,80,32h96A24,24,0,0,1,200,56Zm-16,0a8,8,0,0,0-8-8H80a8,8,0,0,0-8,8V224a8,8,0,0,0,8,8h96a8,8,0,0,0,8-8Z";
  };

  fill = "#928374";
  viewBox = "0 0 256 256";

  waybarIconsDir = pkgs.runCommand "waybar-icons"
    { }
    (
      ''
        mkdir -p $out
      ''
      + lib.concatStringsSep "\n" (
        lib.mapAttrsToList (name: path: ''
          mkdir -p $out/$(dirname ${name})
          cat > $out/${name}.svg <<EOF
            <svg xmlns="http://www.w3.org/2000/svg" fill="${fill}" viewBox="${viewBox}">
              <path d="${path}"/>
            </svg>
          EOF
        '') myWaybarIcons
      )
    );
in {
  home.file."nix/home/waybar/icons".source = waybarIconsDir;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = import ./style.nix;

    settings = [{
      layer = "top";
      position = "bottom";
      height = 28;
      margin = "0 16 16";
      start_hidden = false;
      mode = "dock";
      reload_style_on_change = true;
      spacing = 0;

      modules-left = [ 
        "hyprland/workspaces" 
      ];

      modules-right = [
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

      bluetooth = {
        format = " ";
        format-connected-battery = " ";
        tooltip = true;
        tooltip-format-connected = "{status}";
        tooltip-format-connected-battery = "{status} {device_battery_percentage}%";
      };

      wireplumber = {
        format = " ";
        tooltip = true;
        tooltip-format = "{volume}%";
        on-click = "pavucontrol";
      };

      clock = {
        interval = 1;
        format = "{:%H:%M}";
        tooltip = true;
        tooltip-format = "{:%a %d %b}";
      };

      network = {
        interval = 5;
        format = " ";
        tooltip = true;
        tooltip-format = "{ifname}:{ipaddr}/{cidr} {essid} ({signalStrength}%)";
      };

      battery = {
        interval = 5;
        format = " ";
        format-time = "{H}h {M}m";
        tooltip = true;
        tooltip-format = "{capacity}% {time}";

        states = {
          empty = 10;
          low = 30;
          medium = 50;
          high = 70;
          full = 90;
        };
      };
    }];
  };
}
