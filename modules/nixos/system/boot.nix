{
  lib,
  isServer,
  ...
}: let
  inherit (lib) enabled;
in {
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    plymouth = enabled;

    loader = {
      efi.canTouchEfiVariables = !isServer;
      timeout = 3;

      grub = enabled {
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };

    kernelParams = [
      "quiet"
      "loglevel=3"
      "systemd.show_status=auto"
      "udev.log_level=3"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
    ];
  };
}
