{lib, ...}: let
  inherit (lib) enabled;
in {
  security = {
    polkit = enabled;
    rtkit = enabled;
  };
}
