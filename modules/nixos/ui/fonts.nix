{lib, ...}: let
  inherit (lib) enabled;
in {
  fonts = {
    fontDir = enabled;
    fontconfig = enabled;
  };
}
