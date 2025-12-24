{
  flake.modules.homeManager.waybar = {config, ...}: {
    programs.waybar = {
      enable = true;
      systemd.enable = true;

      settings = [
        {
          layer = "top";
          position = "bottom";
          mode = "dock";

          modules-left = [
            "niri/workspaces"
            "hyprland/workspaces"
          ];

          modules-right = [
            "network"
            "bluetooth"
            "wireplumber"
            "disk"
            "temperature"
            "memory"
            "cpu"
            "battery"
            "clock"
          ];

          network = {
            format-wifi = "NET:{essid}";
            format-ethernet = "NET:{ifname}";
            format-disconnected = "NET:down";
            tooltip = false;
          };

          bluetooth = {
            format = "BT:{status}";
            format-connected = "BT:{num_connections}";
            on-click = "blueberry";
            tooltip = false;
          };

          wireplumber = {
            format-muted = "VOL:muted";
            format = "VOL:{volume}%";
            on-click-middle = "pwvucontrol";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            scroll-step = 5;
            tooltip = false;
          };

          disk = {
            format = "DISK:{percentage_used}%";
            tooltip = false;
          };

          temperature = {
            format = "TEMP:{temperatureC}°C";
            tooltip = false;
          };

          memory = {
            format = "MEM:{percentage}%";
            tooltip = false;
          };

          cpu = {
            format = "CPU:{usage}%";
            tooltip = false;
          };

          battery = {
            format = "BAT:{capacity}%";
            format-charging = "BAT:{capacity}% {time}";
            format-time = "{H}h{M}m";
            tooltip = false;
          };

          clock = {
            format = "{:%a-%d | %R}";
            on-click = "wlogout -b 2 --protocol layer-shell";
          };
        }
      ];

      style = ''
        * {
          background: none;
          border: none;
          border-radius: 0;
          box-shadow: none;
          font-family: ${config.stylix.fonts.monospace.name};
          font-size: ${toString config.stylix.fonts.sizes.terminal}px;
          margin: 0;
          min-height: 0;
          padding: 0;
          text-shadow: none;
          transition: none;
        }

        window#waybar {
          background-color: transparent;
        }

        #network,
        #bluetooth,
        #wireplumber,
        #disk,
        #temperature,
        #memory,
        #cpu,
        #battery,
        #clock {
          color: ${config.stylix.base16Scheme.base05};
          margin: 0 4px;
          min-height: 14px;
          min-width: 14px;
          padding: 1px 3px;
        }

        #workspaces button {
          color: ${config.stylix.base16Scheme.base05};
          min-height: 14px;
          min-width: 14px;
          opacity: 0.5;
          padding: 1px 3px;
        }

        #workspaces button.visible {
          color: ${config.stylix.base16Scheme.base0D};
          opacity: 1;
        }

        #workspaces button.active,
        #workspaces button.active.visible {
          background-color: ${config.stylix.base16Scheme.base0D};
          color: ${config.stylix.base16Scheme.base00};
          opacity: 1;
        }
      '';
    };
  };
}
