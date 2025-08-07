{lib, ...}: let
  inherit (lib) enabled;
in {
  hardware.graphics = enabled {enable32Bit = true;};
}
