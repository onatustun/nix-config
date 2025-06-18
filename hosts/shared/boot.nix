{
  isLaptop,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    tmp.cleanOnBoot = true;

    blacklistedKernelModules =
      [
        "floppy"
        "iTCO_vendor_support"
        "iTCO_wdt"
        "nouveau"
        "pcspkr"
        "snd_pcsp"
      ]
      ++ (
        if !isLaptop
        then [
          "bluetooth"
          "btusb"
        ]
        else ["nvidia"]
      );

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
