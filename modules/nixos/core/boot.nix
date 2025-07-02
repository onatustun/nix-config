{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
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
      efi.canTouchEfiVariables = true;
      timeout = 3;

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };
}
