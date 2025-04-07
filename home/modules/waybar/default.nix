{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    style = import ./style.nix;

    settings = [{
      layer = "top";
      position = "bottom";

      modules-left = [ 
        "hyprland/workspaces" 
      ];

      modules-right = [
        "pulseaudio"
        "network"
        "battery"
        "clock"
      ];

      "hyprland/workspaces" = {
        tooltip = false;
        format = "{icon}";
      };

      clock = {
        interval = 1;
        tooltip = true;
        tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%H:%M}";
      };

      network = {
        interval = 5;
        tooltip = true;
        tooltip-format = "{ifname}:{ipaddr}/{cidr} {essid} ({signalStrength}%)";
        format-wifi = "{icon}";
        format-disconnected = "󰤮";

        format-icons = [
          "󰤯 "
          "󰤟 "
          "󰤢 "
          "󰤥 "
          "󰤨 "
        ];
      };

      pulseaudio = {
        on-click = "sleep 0.1 && pavucontrol";
        tooltip = true;
        tooltip-format = "{volume}%";
        format = "{icon}";
        format-muted = " ";

        format-icons = [
          " " 
          "" 
          ""
        ];
      };

      battery = {
        states = {
          warning = 45;
          critical = 25;
        };

        tooltip = true;
        tooltip-format = "{capacity}% {time}";
        format = "{icon}";
        format-charging = "󰂄";

        format-icons = [
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
      };
    }];
  };
}
