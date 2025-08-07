{
  lib,
  isServer,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  boot = {
    kernelPackages =
      if isServer
      then pkgs.linuxPackages_latest
      else pkgs.linuxKernel.packages.linux_zen;

    tmp.cleanOnBoot = true;

    blacklistedKernelModules = [
      "floppy"
      "iTCO_vendor_support"
      "iTCO_wdt"
      "nouveau"
      "pcspkr"
      "snd_pcsp"
    ];

    loader = {
      efi.canTouchEfiVariables = !isServer;
      timeout = 3;

      grub = enabled {
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };
}
