{
  isLaptop,
  pkgs,
  ...
}: {
  boot = {
    plymouth.enable = true;
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;

    blacklistedKernelModules = [
      "floppy"
      "iTCO_vendor_support"
      "iTCO_wdt"
      "nouveau"
      "pcspkr"
      "snd_pcsp"
    ] ++ (if !isLaptop then [
      "bluetooth"
      "btusb"
    ] else [
      "nvidia"
    ]);

    initrd = {
      systemd.enable = true;
      supportedFilesystems = [
        "ext4"
      ];
    };

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
