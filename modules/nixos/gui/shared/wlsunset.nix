{
  home-manager.sharedModules = [
    {
      services.wlsunset = {
        enable = true;
        gamma = 0.8;
        latitude = -57.149651;
        longitude = -2.099075;
        sunrise = "04:30";
        sunset = "22:00";

        temperature = {
          day = 5500;
          night = 3750;
        };
      };
    }
  ];
}
