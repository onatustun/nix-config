{
  programs.waybar = {
    enable = false;

    settings = [{
	    position = "bottom";
      layer = "top";
      height = 30;
	    reload_style_on_change = true;

	    modules-left = [
	      "hyprland/workspaces"
	    ];

	    modules-right = [
	      "cpu"
	      "memory"
	      "temperature"
	      "pulseaudio"
	      "network"
	      "battery"
	      "clock"
	    ];

	    "hyprland/workspaces" = {
	      format = "{icon}";
	      tooltip = false;
	    };

	    cpu = {
	      format = "";
	      tooltip = true;
        tooltip-formmat = "{usage}%";
	    };

	    memory = {
	      format = "";
	      tooltip = true;
        tooltip-format = "{percentage}%";
	    };

      temperature = {
	      critical-threshold = 80;
	      format = "{icon}";
        tooltip = true;
        tooltip-format = "{temperatureC}°C";

	      format-icons = [
          "" 
          "" 
	        ""
          ""
	        ""
	      ];
      };

	    pulseaudio = {
	      format = "{icon}";
	      format-muted = "";
	      tooltip = true;
        tooltip-format = "{volume}%";
	      on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

	      format-icons = [
	        "" 
	        "" 
	        ""
        ];
	    };

      network = {
        format-wifi = "{icon}";
	      format-disconnected = "󰤮";
        interval = 5;
	      tooltip = true;
        tooltip-format = "{ifname}:{ipaddr}/{cidr} {essid} ({signalStrength}%)";

        format-icons = [
          "󰤯"
          "󰤟"
          "󰤢"
          "󰤥"
          "󰤨"
        ];
	    };

      battery = {
        format = "{icon}";
	      format-charging = "󰚥";
	      tooltip = true;
        tooltip-format = "{capacity}% {time}";

	      states = {
	        good = 85;
	        warning = 40;
	        critical = 25;
	      };
	      
	      format-icons = [
	        ""
	        ""
	        ""
	        ""
	        ""
        ];
	    };

      clock = {
	      format = "{:%H:%M}";
	      interval = 1;
        tooltip = true;
        tooltip-format = "{:%a %d/%m}";
	    };
    }];
    
    style = ''
      * {
        font-family:JetBrainsMono Nerd Font;
        font-size:12px;
        font-weight: bold;
        border: none;
      }

      window#waybar {
        background-color: #1d2021;
        color: #928374;
      }

      #cpu,
      #memory,
      #temperature,
      #pulseaudio,
      #network,
      #battery,
      #clock {
        margin: 0 10px;
        padding: 0.5px;
      }

      #workspaces button {
        color: #928374;
        padding: 0.5px;
        margin: 0 10px;
      }

      #workspaces button.active {
        color: #ebdbb2;
      }

      #battery.critical,
      #network.disabled, 
      #network.disconnected,
      #pulseaudio.muted,
      #temperature.critical {
        color: #cc241d;
      }

      #battery.charging,
      #battery.warning {
        color: #d65d0e;
      }
    '';
  };
}
