{
  config,
  lib,
  pkgs,
  ...
}: let
  icons = let
    myWaybarIcons = {
      "network-default" = "M244.35,92.8l-104,125.43A15.93,15.93,0,0,1,128,224h0a15.93,15.93,0,0,1-12.31-5.77L11.65,92.8A15.65,15.65,0,0,1,8.11,80.91,15.93,15.93,0,0,1,14.28,70.1,186.67,186.67,0,0,1,128,32A186.67,186.67,0,0,1,241.72,70.1a15.93,15.93,0,0,1,6.17,10.81A15.65,15.65,0,0,1,244.35,92.8Z";
      "network-ethernet" = "M232,112H136V88h8a16,16,0,0,0,16-16V40a16,16,0,0,0-16-16H112A16,16,0,0,0,96,40V72a16,16,0,0,0,16,16h8v24H24a8,8,0,0,0,0,16H56v32H48a16,16,0,0,0-16,16v32a16,16,0,0,0,16,16H80a16,16,0,0,0,16-16V176a16,16,0,0,0-16-16H72V128H184v32h-8a16,16,0,0,0-16,16v32a16,16,0,0,0,16,16h32a16,16,0,0,0,16-16V176a16,16,0,0,0-16-16h-8V128h32a8,8,0,0,0,0-16ZM112,40h32V72H112ZM80,208H48V176H80Zm128,0H176V176h32Z";
      "wireplumber-default" = "M168,32V224a8,8,0,0,1-12.91,6.31L85.25,176H40a16,16,0,0,1-16-16V96A16,16,0,0,1,40,80H85.25l69.84-54.31A8,8,0,0,1,168,32Zm32,64a8,8,0,0,0-8,8v48a8,8,0,0,0,16,0V104A8,8,0,0,0,200,96Zm32-16a8,8,0,0,0-8,8v80a8,8,0,0,0,16,0V88A8,8,0,0,0,232,80Z";
      "keyboard" = "M224,48H32A16,16,0,0,0,16,64V192a16,16,0,0,0,16,16H224a16,16,0,0,0,16-16V64A16,16,0,0,0,224,48Zm0,144H32V64H224V192Zm-16-64a8,8,0,0,1-8,8H56a8,8,0,0,1,0-16H200A8,8,0,0,1,208,128Zm0-32a8,8,0,0,1-8,8H56a8,8,0,0,1,0-16H200A8,8,0,0,1,208,96ZM72,160a8,8,0,0,1-8,8H56a8,8,0,0,1,0-16h8A8,8,0,0,1,72,160Zm96,0a8,8,0,0,1-8,8H96a8,8,0,0,1,0-16h64A8,8,0,0,1,168,160Zm40,0a8,8,0,0,1-8,8h-8a8,8,0,0,1,0-16h8A8,8,0,0,1,208,160Z";
    };

    waybarIconsDir = pkgs.runCommand "waybar-icons" {} ''
      mkdir -p $out
      ${lib.concatStringsSep "\n" (
        lib.mapAttrsToList (name: path: ''
                  cat > $out/${name}.svg <<EOF
          <svg xmlns="http://www.w3.org/2000/svg" fill="${config.stylix.base16Scheme.base05}" viewBox="0 0 256 256">
            <path d="${path}"/>
          </svg>
          EOF
        '')
        myWaybarIcons
      )}
    '';
  in {waybarIconsDir = waybarIconsDir;};

  iconsPath = "${icons.waybarIconsDir}";
in {
  home-manager.sharedModules = [
    {
      programs.waybar = {
        enable = true;
        systemd.enable = true;

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
              "tray"
              "network"
              "wireplumber"
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

            tray = {
              icon-size = 14;
            };

            network = {
              interval = 5;
              format = " ";
              format-disabled = "";
              format-disconnected = "";
              format-ethernet = " ";
              on-click = "nm-connection-editor";
              tooltip = true;
              tooltip-format = "{ifname}:{ipaddr}/{cidr} {essid} ({signalStrength}%)";
            };

            wireplumber = {
              format = " ";
              format-muted = "";
              tooltip = true;
              tooltip-format = "{volume}%";
              on-click = "pwvucontrol";
              on-click-middle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              scroll-step = 5;
              max-volume = 100.0;
            };

            battery = {
              interval = 60;
              format = "{icon} {capacity}%";
              format-time = "{H}h{M}m";
              format-charging = "󰂄 {time}";
              tooltip = true;
              tooltip-format = "{capacity}% {time}";

              format-icons = [
                "󰂎"
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

            clock = {
              interval = 1;
              format = "{:%H:%M}";
              tooltip = true;
              tooltip-format = "{:%a %d %b}";
            };

            "custom/power" = {
              format = " ⏻";
              tooltip = false;
              on-click = "wlogout --protocol layer-shell";
            };
          }
        ];

        style = ''
          * {
            background: none;
            border-radius: 0;
            border: none;
            box-shadow: none;
            font-family: JetBrainsMono Nerd Font Mono;
            font-size: 14px;
            margin: 0;
            min-height: 0;
            padding: 0;
            text-shadow: none;
            transition: none;
          }

          window#waybar {
            background-color: ${config.stylix.base16Scheme.base00};
          }

          .modules-left,
          .modules-right {
            padding: 0 10px;
          }

          tooltip {
            padding: 0;
            margin: 0;
            background-color: ${config.stylix.base16Scheme.base00};
            color: ${config.stylix.base16Scheme.base05};
            border-width: 0px;
            border-color: ${config.stylix.base16Scheme.base0C};
            border-radius: 6px;
          }

          tooltip label {
            padding: 0;
            margin: 0;
            background-color: inherit;
            color: ${config.stylix.base16Scheme.base05};
          }

          #custom-keyboard,
          #network,
          #wireplumber,
          #battery,
          #clock,
          #workspaces button,
          #taskbar button {
            min-width: 14px;
            min-height: 14px;
            padding: 1px 3px;
            color: ${config.stylix.base16Scheme.base05};
            background-repeat: no-repeat;
            background-position: center;
            background-size: 14px;
          }

          #wireplumber.muted,
          #network.disabled,
          #network.disconnected {
            background-image: none;
            margin: 0;
            min-height: 0;
            min-width: 0;
            opacity: 0;
            padding: 0;
          }

          tooltip {
            border-radius: 4px;
          }

          #custom-keyboard {
            background-image: url("${iconsPath}/keyboard.svg");
          }

          #custom-keyboard.disabled {
            opacity: 0.5;
          }

          #network {
            background-image: url("${iconsPath}/network-default.svg");
          }

          #network.ethernet {
            background-image: url("${iconsPath}/network-ethernet.svg");
          }

          #network.disabled,
          #network.disconnected {
            opacity: 0.3;
          }

          #wireplumber {
            background-image: url("${iconsPath}/wireplumber-default.svg");
          }

          #wireplumber.muted {
            opacity: 0.3;
          }

          #workspaces button {
            opacity: 0.5;
            background-image: none;
          }

          #workspaces button.active {
            opacity: 1;
            background-color: ${config.stylix.base16Scheme.base0D};
            color: ${config.stylix.base16Scheme.base00};
          }

          #workspaces button.active.visible {
            opacity: 1;
            background-color: ${config.stylix.base16Scheme.base0D};
            color: ${config.stylix.base16Scheme.base00};
          }

          #workspaces button.visible {
            opacity: 1;
            color: ${config.stylix.base16Scheme.base0D};
          }

          #custom-keyboard.hidden {
            opacity: 0;
            min-width: 0;
            margin: 0;
            padding: 0;
          }
        '';
      };
    }
  ];
}
