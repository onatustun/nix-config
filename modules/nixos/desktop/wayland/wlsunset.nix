{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = with pkgs; [
    brightnessctl
    wlsunset
  ];

  home-manager.sharedModules = [
    {
      services.wlsunset = enabled {
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
