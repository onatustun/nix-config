{lib, ...}: {
  hardware.graphics = let
    inherit (lib) enabled;
  in
    enabled {enable32Bit = true;};
}
