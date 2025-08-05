{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.swaylock];

  home-manager.sharedModules = [
    {
      programs.swaylock = let
        inherit (lib) enabled;
      in
        enabled {
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
