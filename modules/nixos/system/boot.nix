{
  lib,
  isServer,
  ...
}: let
  inherit (lib) enabled;
in {
  boot.loader = {
    efi.canTouchEfiVariables = !isServer;
    timeout = 3;

    grub = enabled {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };
}
