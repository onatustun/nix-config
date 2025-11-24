{
  flake.modules.homeManager.wlsunset = {pkgs, ...}: {
    home.packages = [pkgs.wlsunset];

    services.wlsunset = {
      enable = true;
      gamma = 0.8;
      latitude = -57.149651;
      longitude = -2.099075;

      temperature = {
        day = 4250;
        night = 2750;
      };
    };
  };
}
