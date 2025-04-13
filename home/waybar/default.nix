{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
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
        format-charging = " ";
        tooltip = true;
        tooltip-format-connected = "{device_alias}";
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
        format = " ";
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
