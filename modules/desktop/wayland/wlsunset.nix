{
  flake.modules.homeManager.wlsunset = {pkgs, ...}: {
    home.packages = [
      pkgs.brightnessctl
      pkgs.geoclue2
      pkgs.wlsunset
    ];

    services.wlsunset = {
      enable = true;
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
