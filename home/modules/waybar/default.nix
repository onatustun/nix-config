{
  programs.waybar = {
    enable = true;

    systemd = {
      enable = false;
      target = "graphical-session.target";
    };

    settings = [
      {
        layer = "top";
        position = "bottom";

        modules-left = [ "hyprland/workspaces" ];

        modules-right = [
          "pulseaudio"
          "network"
          "battery"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M}";
	        interval = 1;
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };

        network = {
          format-icons = [
            "󰤯 "
            "󰤟 "
            "󰤢 "
            "󰤥 "
            "󰤨 "
          ];

          format-wifi = "{icon}";
          interval = 5;
          tooltip = true;
          tooltip-format = "{ifname}:{ipaddr}/{cidr} {essid} ({signalStrength}%)";
          format-disconnected = "󰤮";
          on-click = "nmtui";
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = " ";
          tooltip = true;
          tooltip-format = "{volume}%";
          on-click = "sleep 0.1 && pavucontrol";

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
          format = "{icon}";
          format-charging = "󰂄";
          tooltip-format = "{capacity}% {time}";
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
          tooltip = true;
        };
      }
    ];

    style = import ./waybar/style.nix;
  };
}
