{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) concatStringsSep mapAttrsToList;
  inherit (pkgs) runCommand;
in {
  home-manager.sharedModules = [
    {
      programs.waybar.style = let
        icons = let
          myWaybarIcons = {
            power = {
              path = "M8.205 4.844a1 1 0 0 1 .844 1.813A6.997 6.997 0 0 0 12 20a6.998 6.998 0 0 0 2.965-13.336 1 1 0 0 1 .848-1.812A8.996 8.996 0 0 1 21 13.003C21 17.973 16.97 22 12 22s-9-4.028-9-8.996a8.996 8.996 0 0 1 5.205-8.16ZM12 2a1 1 0 0 1 .993.883L13 3v7a1 1 0 0 1-1.993.118L11 10V3a1 1 0 0 1 1-1Z";
              viewbox = "24";
            };

            network = {
              path = "M17.784 10.708a8.35 8.35 0 0 1 1.504 2.085 1 1 0 0 1-1.781.91 6.353 6.353 0 0 0-1.137-1.58 6.128 6.128 0 0 0-9.8 1.562 1 1 0 0 1-1.784-.903 8.128 8.128 0 0 1 12.998-2.074ZM15.735 13.7c.46.46.838 1.024 1.101 1.624a1 1 0 1 1-1.832.803 3.36 3.36 0 0 0-.683-1.013 3.233 3.233 0 0 0-4.572 0 3.257 3.257 0 0 0-.672 1 1 1 0 1 1-1.832-.802 5.25 5.25 0 0 1 1.09-1.612 5.233 5.233 0 0 1 7.4 0Zm4.684-5.401c.508.508.987 1.087 1.404 1.691a1 1 0 0 1-1.646 1.136c-.35-.506-.752-.993-1.172-1.413-3.872-3.872-10.15-3.872-14.023 0-.4.399-.797.886-1.16 1.41a1 1 0 0 1-1.644-1.14c.428-.618.9-1.195 1.39-1.684 4.653-4.654 12.198-4.654 16.851 0Zm-7.358 8.142a1.501 1.501 0 1 1-2.122 2.123 1.501 1.501 0 0 1 2.122-2.123Z";
              viewbox = "24";
            };

            network-ethernet = {
              path = "M 7 2 L 7 3 L 13 3 L 13 10 L 7 10 L 7 12 L 7 13 L 6 13 C 5.4459904 13 5 12.55401 5 12 L 5 10 L 5 8 L 5 7 L 6 7 L 6 3 L 3 3 L 3 7 L 4 7 L 4 8 L 4 10 L 4 12 C 4 13.108 4.892 14 6 14 L 7 14 L 9 14 L 11 14 L 11 13 L 9 13 L 9 12 L 14 12 L 14 11 L 14 10 L 14 2 L 7 2 z M 4 5 L 5 5 L 5 6 L 4 6 L 4 5 z M 2 8 L 2 12 L 3 12 L 3 10 L 3 8 L 2 8 z";
              viewbox = "14";
            };

            network-off = {
              path = "m12.858 14.273 7.434 7.434a1 1 0 0 0 1.414-1.414l-17.999-18a1 1 0 1 0-1.414 1.414L5.39 6.804c-.643.429-1.254.927-1.821 1.495a12.382 12.382 0 0 0-1.39 1.683 1 1 0 0 0 1.644 1.14c.363-.524.761-1.01 1.16-1.41a9.94 9.94 0 0 1 1.855-1.46L7.99 9.405a8.14 8.14 0 0 0-3.203 3.377 1 1 0 0 0 1.784.903 6.08 6.08 0 0 1 1.133-1.563 6.116 6.116 0 0 1 1.77-1.234l1.407 1.407A5.208 5.208 0 0 0 8.336 13.7a5.25 5.25 0 0 0-1.09 1.612 1 1 0 0 0 1.832.802c.167-.381.394-.722.672-1a3.23 3.23 0 0 1 3.108-.841Zm-1.332-5.93 2.228 2.229a6.1 6.1 0 0 1 2.616 1.55c.444.444.837.995 1.137 1.582a1 1 0 1 0 1.78-.911 8.353 8.353 0 0 0-1.503-2.085 8.108 8.108 0 0 0-6.258-2.365ZM8.51 5.327l1.651 1.651a9.904 9.904 0 0 1 10.016 4.148 1 1 0 1 0 1.646-1.136A11.912 11.912 0 0 0 8.51 5.327Zm4.552 11.114a1.501 1.501 0 1 1-2.123 2.123 1.501 1.501 0 0 1 2.123-2.123Z";
              viewbox = "24";
            };

            battery-critical = {
              path = "M8.244 11.2a1.5 1.5 0 0 1 .556.556l4.01 6.998A1.5 1.5 0 0 1 11.507 21H3.489a1.5 1.5 0 0 1-1.302-2.246l4.01-6.998a1.5 1.5 0 0 1 2.047-.556ZM7.5 18a.5.5 0 1 0 0 1 .5.5 0 0 0 0-1ZM17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3h-3.471l-3.861-6.741a2.5 2.5 0 0 0-4.339 0l-2.965 5.176A2.987 2.987 0 0 1 2 15V9a3 3 0 0 1 3-3h12Zm-9.502 7a.5.5 0 0 0-.5.5v3l.008.09a.5.5 0 0 0 .992-.09v-3l-.008-.09a.5.5 0 0 0-.492-.41Z";
              viewbox = "24";
            };

            battery-empty = {
              path = "M2 9a3 3 0 0 1 3-3h12a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9Z";
              viewbox = "24";
            };

            battery-1 = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12ZM7 9H5.998a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1H7a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-2 = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12ZM8 9H5.998a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1H8a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-3 = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12ZM9 9H6.017a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1H9a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-4 = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12Zm-7 3H6a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-half = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12Zm-6 3H6a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-6 = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12Zm-5 3H6a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-7 = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12Zm-3 3H6a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-8 = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12Zm-3 3H6a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-9 = {
              path = "M6 9a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1H6ZM2 9a3 3 0 0 1 3-3h12.5a3 3 0 0 1 3 3v1h.5a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-.5v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9Z";
              viewbox = "24";
            };

            battery-full = {
              path = "M17 6a3 3 0 0 1 3 3v1h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-1v1a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h12Zm-1 3H6a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1Z";
              viewbox = "24";
            };

            battery-charge = {
              path = "M10.75 6H17a3 3 0 0 1 2.995 2.824L20 9v1l1 .018a1 1 0 0 1 .993.879l.008.12v2a1 1 0 0 1-.866.992l-.134.009L20 14v1a3 3 0 0 1-2.824 2.995L17 18H7.995a.75.75 0 0 1-.743-.648l-.007-.102v-4.5a.75.75 0 0 1 .649-.743L7.995 12h.628c.716 0 1.304-.546 1.37-1.245l.007-.132V6.75a.75.75 0 0 1 .648-.743L10.75 6H17h-6.25ZM6.645 4.007 6.747 4a.75.75 0 0 1 .743.648l.007.102L7.496 6h.758a.75.75 0 0 1 .75.75v2.499a1.75 1.75 0 0 1-1.75 1.75l-1.003-.001v6.245a.75.75 0 0 1-.647.743l-.102.007a.75.75 0 0 1-.743-.648l-.007-.102v-6.245H3.75A1.75 1.75 0 0 1 2 9.249V6.75A.75.75 0 0 1 2.75 6h.751V4.75a.75.75 0 0 1 .648-.743L4.251 4a.75.75 0 0 1 .743.648l.007.102V6h.995V4.75a.75.75 0 0 1 .65-.743l.1-.007-.1.007Z";
              viewbox = "24";
            };

            wireplumber-muted = {
              path = "M15 4.25c0-1.079-1.274-1.65-2.08-.934L8.427 7.309a.75.75 0 0 1-.498.19H4.25A2.25 2.25 0 0 0 2 9.749v4.497a2.25 2.25 0 0 0 2.25 2.25h3.68a.75.75 0 0 1 .498.19l4.491 3.994c.806.716 2.081.144 2.081-.934V4.25ZM16.22 9.22a.75.75 0 0 1 1.06 0L19 10.94l1.72-1.72a.75.75 0 1 1 1.06 1.06L20.06 12l1.72 1.72a.75.75 0 1 1-1.06 1.06L19 13.06l-1.72 1.72a.75.75 0 1 1-1.06-1.06L17.94 12l-1.72-1.72a.75.75 0 0 1 0-1.06Z";
              viewbox = "24";
            };

            wireplumber = {
              path = "M15 4.25v15.496c0 1.078-1.274 1.65-2.08.934l-4.492-3.994a.75.75 0 0 0-.498-.19H4.25A2.25 2.25 0 0 1 2 14.247V9.75a2.25 2.25 0 0 1 2.25-2.25h3.68a.75.75 0 0 0 .498-.19l4.491-3.993C13.726 2.599 15 3.17 15 4.25Zm3.992 1.647a.75.75 0 0 1 1.049.157A9.959 9.959 0 0 1 22 12a9.96 9.96 0 0 1-1.96 5.946.75.75 0 0 1-1.205-.892A8.459 8.459 0 0 0 20.5 12a8.459 8.459 0 0 0-1.665-5.054.75.75 0 0 1 .157-1.049ZM17.143 8.37a.75.75 0 0 1 1.017.303c.536.99.84 2.125.84 3.328a6.973 6.973 0 0 1-.84 3.328.75.75 0 0 1-1.32-.714c.42-.777.66-1.666.66-2.614s-.24-1.837-.66-2.614a.75.75 0 0 1 .303-1.017Z";
              viewbox = "24";
            };
          };

          waybarIconsDir = runCommand "waybar-icons" {} ''
            mkdir -p "$out"
            ${concatStringsSep "\n" (mapAttrsToList (name: icon: ''
                cat > "$out/${name}.svg" <<EOF
                <svg xmlns="http://www.w3.org/2000/svg" fill="${config.stylix.base16Scheme.base05}" viewBox="0 0 ${icon.viewbox} ${icon.viewbox}">
                  <path d="${icon.path}"/>
                </svg>
                EOF
              '')
              myWaybarIcons)}
          '';
        in {inherit waybarIconsDir;};
        inherit (icons) waybarIconsDir;
      in ''
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

        #network,
        #wireplumber,
        #battery,
        #clock,
        #custom-power,
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

        #custom-power {
          background-image: url("${waybarIconsDir}/power.svg");
        }

        #wireplumber.muted {
          background-image: url("${waybarIconsDir}/wireplumber-muted.svg");
        }

        #wireplumber {
          background-image: url("${waybarIconsDir}/wireplumber.svg");
        }

        #battery.critical {
          background-image: url("${waybarIconsDir}/battery-critical.svg");
        }

        #battery.empty {
          background-image: url("${waybarIconsDir}/battery-empty.svg");
        }

        #battery.p15 {
          background-image: url("${waybarIconsDir}/battery-1.svg");
        }

        #battery.p25 {
          background-image: url("${waybarIconsDir}/battery-2.svg");
        }

        #battery.p35 {
          background-image: url("${waybarIconsDir}/battery-3.svg");
        }

        #battery.p45 {
          background-image: url("${waybarIconsDir}/battery-4.svg");
        }

        #battery.half {
          background-image: url("${waybarIconsDir}/battery-half.svg");
        }

        #battery.p65 {
          background-image: url("${waybarIconsDir}/battery-6.svg");
        }

        #battery.p75 {
          background-image: url("${waybarIconsDir}/battery-7.svg");
        }

        #battery.p85 {
          background-image: url("${waybarIconsDir}/battery-8.svg");
        }

        #battery.full {
          background-image: url("${waybarIconsDir}/battery-full.svg");
        }

        #battery.charging {
          background-image: url("${waybarIconsDir}/battery-charge.svg");
        }

        #network, #network.wifi {
          background-image: url("${waybarIconsDir}/network.svg");
        }

        #network.ethernet {
          background-image: url("${waybarIconsDir}/network-ethernet.svg");
        }

        #network.disabled, #network.disconnected {
          background-image: url("${waybarIconsDir}/network-off.svg");
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
      '';
    }
  ];
}
