{lib, ...}: {
  hardware.bluetooth = let
    inherit (lib) enabled;
  in
    enabled {powerOnBoot = true;};
  services.blueman.enable = true;
}
