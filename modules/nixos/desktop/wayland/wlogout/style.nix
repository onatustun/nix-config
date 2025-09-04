{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkDefault;
in {
  environment.systemPackages = [pkgs.wleave];

  home-manager.sharedModules = [
    {
      programs.wlogout.style = mkDefault ''
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
    }
  ];
}
