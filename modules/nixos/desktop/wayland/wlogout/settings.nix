{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
  package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.wlogout;
in {
  environment.systemPackages = [package];

  home-manager.sharedModules = [
    {
      programs.wlogout = enabled {
        inherit package;

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
      };
    }
  ];
}
