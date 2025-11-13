{
  flake.modules.homeManager.wlsunset = {
    pkgs,
    inputs',
    ...
  }: let
    package = inputs'.nixpkgs-wayland.packages.wlsunset;
  in {
    home.packages = [
      package
      pkgs.brightnessctl
      pkgs.geoclue2
    ];

    services.wlsunset = {
      enable = true;
      inherit package;

      gamma = 0.7;
      latitude = -57.149651;
      longitude = -2.099075;

      temperature = {
        day = 3750;
        night = 2250;
      };
    };
  };
}
