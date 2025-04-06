{lib, ...}: let
  inherit (lib) enabled;
in {
  services.displayManager.gdm = enabled {wayland = true;};
}
