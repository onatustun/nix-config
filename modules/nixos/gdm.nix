{lib, ...}: {
  services.displayManager.gdm = let
    inherit (lib) enabled;
  in
    enabled {wayland = true;};
}
