{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) enabled mkDefault;
in {
  environment.systemPackages = [pkgs.wlogout];

  home-manager.sharedModules = [
    {
      programs.wlogout = enabled {
        layout = [
          {
            label = "lock";
            action = "swaylock -DefF";
            text = "Lock";
          }
          {
            label = "hibernate";
            action = "systemctl hibernate";
            text = "Hibernate";
          }
          {
            label = "logout";
            action = "loginctl terminate-user $USER";
            text = "Logout";
          }
          {
            label = "shutdown";
            action = "systemctl poweroff";
            text = "Shutdown";
          }
          {
            label = "suspend";
            action = "systemctl suspend";
            text = "Suspend";
          }
          {
            label = "reboot";
            action = "systemctl reboot";
            text = "Reboot";
          }
        ];

        style = mkDefault ''
          * {
            background-image: none;
            font-size: 20px;
          }

          button {
            color: ${config.stylix.base16Scheme.base07};
            color: ${config.stylix.base16Scheme.base00};
            border-style: solid;
            border-radius: 0px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 15%;
          }

          button:focus,
          button:active,
          button:hover {
            background-color: ${config.stylix.base16Scheme.base0D};
            outline-style: none;
          }
        '';
      };
    }
  ];
}
