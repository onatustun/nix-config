{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  hardware.bluetooth = enabled {powerOnBoot = true;};
  services.blueman = enabled;
  environment.systemPackages = [pkgs.blueberry];
}
