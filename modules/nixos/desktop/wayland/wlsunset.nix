{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
  package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.wlsunset;
in {
  environment.systemPackages = [
    pkgs.brightnessctl
    package
  ];

  home-manager.sharedModules = [
    {
      services.wlsunset = enabled {
        inherit package;

        gamma = 0.8;
        latitude = -57.149651;
        longitude = -2.099075;

        temperature = {
          day = 5500;
          night = 3750;
        };
      };
    }
  ];
}
