{
  flake.modules.homeManager.waybar = {config, ...}: {
    programs.waybar = {
      enable = true;
      systemd.enable = true;

      settings = [
        {
          layer = "top";
          position = "bottom";
          margin = "0 0 0";
          mode = "dock";

          modules-left = [
            "niri/workspaces"
            "hyprland/workspaces"
          ];

          modules-right = [
            "temperature"
            "memory"
            "cpu"
            "battery"
            "clock"
          ];

          "hyprland/workspaces".tooltip = false;

          clock = {
            format = "{:%a-%d | %R}";
            on-click = "wlogout -b 2 --protocol layer-shell";
          };

          temperature = {
            format = "TEMP:{temperatureC}°C";
            tooltip = false;
          };

          memory = {
            format = "MEM:{used:0.1f}G";
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

        .modules-left,
        .modules-right {
          padding: 0 10px;
        }

        #battery,
        #clock,
        #cpu,
        #memory,
        #temperature {
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
