{
  config,
  isLaptop,
  lib,
  pkgs,
  ...
}: let
  toggleKeyboardScript = pkgs.writeScriptBin "toggle-laptop-keyboard" ''
    #!/${pkgs.runtimeShell}
    CACHE_DIR="''${XDG_CACHE_HOME:-$HOME/.cache}"
    STATE_FILE="$CACHE_DIR/laptop-keyboard-disabled"
    KEYBOARD_NAME="at-translated-set-2-keyboard"

    mkdir -p "$CACHE_DIR"

    if [ "$1" == "--toggle" ]; then
      if [ -f "$STATE_FILE" ]; then
        rm "$STATE_FILE"
        ${pkgs.hyprland}/bin/hyprctl keyword "device[$KEYBOARD_NAME]:enabled" 1
      else
        touch "$STATE_FILE"
        ${pkgs.hyprland}/bin/hyprctl keyword "device[$KEYBOARD_NAME]:enabled" 0
      fi
    fi

    if [ -f "$STATE_FILE" ]; then
      echo '{"text": "disabled", "class": "disabled"}'
    else
      echo '{"text": "enabled", "class": "enabled"}'
    fi
  '';

  icons = import ./icons.nix {inherit pkgs lib config;};
  iconsPath = "${icons.waybarIconsDir}";
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = import ./style.nix {inherit iconsPath config;};

    settings = [
      {
        layer = "top";
        position = "bottom";
        margin = "0 512 0";
        mode = "dock";

        modules-left = [
          "niri/workspaces"
          "hyprland/workspaces"
        ];

        modules-right = [
          "custom/keyboard"
          "network"
          "wireplumber"
          "battery"
          "clock"
        ];

        "niri/workspaces" = {
          format = "{icon}";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          tooltip = false;
        };

        "custom/keyboard" = {
          format = " ";
          tooltip = false;
          on-click = "${toggleKeyboardScript}/bin/toggle-laptop-keyboard --toggle";
          exec = ''
            if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ] && [ "${
              if isLaptop
              then "true"
              else "false"
            }" = "true" ]; then
              ${toggleKeyboardScript}/bin/toggle-laptop-keyboard
            else
              echo '{"text": "", "class": "hidden"}'
            fi
          '';
          return-type = "json";
          interval = 1;
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
          on-click = "pavucontrol";
        };

        battery = {
          interval = 60;
          format = "{icon} {capacity}%";
          format-time = "{H}h{M}m";
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
          format = "[{:%H:%M}]";
          tooltip = true;
          tooltip-format = "{:%a %d %b}";
        };
      }
    ];
  };
}
