{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.brightnessctl];

  home-manager.sharedModules = [
    {
      services.wlsunset = {
        enable = true;
        package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.wlsunset;

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
