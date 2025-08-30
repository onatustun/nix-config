{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
  package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.swaylock;
in {
  environment.systemPackages = [package];

  home-manager.sharedModules = [
    {
      programs.swaylock = enabled {
        inherit package;

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
