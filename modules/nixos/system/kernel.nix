{
  isServer,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages =
      if isServer
      then pkgs.linuxPackages_latest
      else pkgs.linuxKernel.packages.linux_zen;

    blacklistedKernelModules = [
      "floppy"
      "iTCO_vendor_support"
      "iTCO_wdt"
      "nouveau"
      "pcspkr"
      "snd_pcsp"
    ];
  };
}
