{
  isLaptop,
  pkgs,
  ...
}: {
  boot = {
    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth.enable = true;
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

    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "plymouth.use-simpledrm"
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
