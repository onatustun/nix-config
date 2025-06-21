{
  config,
  lib,
  ...
}: {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "lock";
        action = "swaylock -DefF";
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

    style = lib.mkDefault ''
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

      #lock {
        background-image: image(
          url("${config.programs.wlogout.package}/share/wlogout/icons/lock.png"),
          url("/usr/local/share/wlogout/icons/lock.png")
        );
        color: ${config.stylix.base16Scheme.base07};
      }

      #logout {
        background-image: image(
          url("${config.programs.wlogout.package}/share/wlogout/icons/logout.png"),
          url("/usr/local/share/wlogout/icons/logout.png")
        );
        color: ${config.stylix.base16Scheme.base07};
      }

      #suspend {
        background-image: image(
          url("/${config.programs.wlogout.package}/share/wlogout/icons/suspend.png"),
          url("/usr/local/share/wlogout/icons/suspend.png")
        );
        color: ${config.stylix.base16Scheme.base07};
      }

      #hibernate {
        background-image: image(
          url("/${config.programs.wlogout.package}/share/wlogout/icons/hibernate.png"),
          url("/usr/local/share/wlogout/icons/hibernate.png")
        );
        color: ${config.stylix.base16Scheme.base07};
      }

      #shutdown {
        background-image: image(
          url("/${config.programs.wlogout.package}/share/wlogout/icons/shutdown.png"),
          url("/usr/local/share/wlogout/icons/shutdown.png")
        );
        color: ${config.stylix.base16Scheme.base07};
      }

      #reboot {
        background-image: image(
          url("/${config.programs.wlogout.package}/share/wlogout/icons/reboot.png"),
          url("/usr/local/share/wlogout/icons/reboot.png")
        );
        color: ${config.stylix.base16Scheme.base07};
      }
    '';
  };
}
