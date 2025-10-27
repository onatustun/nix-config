{
  pkgs,
  inputs',
  ...
}: {
  environment.systemPackages = [pkgs.brightnessctl];

  home-manager.sharedModules = [
    {
      services.wlsunset = {
        enable = true;
        package = inputs'.nixpkgs-wayland.packages.wlsunset;

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
