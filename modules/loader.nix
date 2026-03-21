{
  flake.nixosModules.loader.boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    plymouth.enable = true;
    tmp.cleanOnBoot = true;

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
