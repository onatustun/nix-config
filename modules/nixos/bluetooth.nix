{lib, ...}: let
  inherit (lib) enabled;
in {
  hardware.bluetooth = enabled {powerOnBoot = true;};
  services.blueman.enable = true;
}
