{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  services = {
    blueman = enabled;

    avahi = enabled {
      nssmdns4 = true;
      openFirewall = true;
    };

    printing = enabled {
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };
  };

  hardware.bluetooth = enabled {powerOnBoot = true;};
  environment.systemPackages = [pkgs.blueberry];
}
