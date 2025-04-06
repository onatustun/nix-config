{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = [pkgs.swaylock];

  home-manager.sharedModules = [
    {
      programs.swaylock = enabled {
        settings = {
          font-size = 50;
          indicator-radius = 100;
          indicator-thickness = 10;
          line-uses-ring = true;
          indicator-idle-visible = true;
          daemonize = true;
          scaling = "fill";
        };
      };
    }
  ];
}
