{
  flake.modules.homeManager.wlogout = {
    pkgs,
    inputs',
    lib,
    ...
  }: {
    home.packages = [pkgs.wleave];

    programs.wlogout = {
      enable = true;
      package = inputs'.nixpkgs-wayland.packages.wlogout;

      layout = [
        {
          label = "lock";
          action = "swaylock -DefF";
          text = "Lock";
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
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
        }
      ];

      style = lib.mkDefault ''
        * {
          background-image: none;
          box-shadow: none;
        }

        window {
          background-color: transparent;
        }

        button {
          border-radius: 0;
          border-style: solid;
          border-width: 1px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
        }

        button:focus,
        button:active,
        button:hover {
          outline-style: none;
        }

        #lock {
          background-image: image(url("${pkgs.wleave}/share/wleave/icons/lock.svg"));
        }

        #logout {
          background-image: image(url("${pkgs.wleave}/share/wleave/icons/logout.svg"));
        }

        #shutdown {
          background-image: image(url("${pkgs.wleave}/share/wleave/icons/shutdown.svg"));
        }

        #reboot {
          background-image: image(url("${pkgs.wleave}/share/wleave/icons/reboot.svg"));
        }
      '';
    };
  };
}
