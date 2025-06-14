{
  isLaptop,
  pkgs,
  ...
}: {
  systemd.services = {
    NetworkManager-wait-online.enable = false;
    systemd-networkd-wait-online.enable = false;
  };
  
  services.journald.extraConfig = ''
    SystemMaxUse=100M
    RuntimeMaxUse=50M
    ForwardToSyslog=no
    ForwardToWall=no
  '';

  boot = {
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
      verbose = false;
    };

    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "udev.log_level=3"
      "rd.systemd.show_status=auto"
      "nmi_watchdog=0"
      "rootwait"
      "rd.timeout=10"
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
