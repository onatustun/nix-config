{
  flake.modules.nixos.hardware-desktop = {
    modulesPath,
    lib,
    config,
    ...
  }: {
    imports = [(modulesPath + "/installer/scan/not-detected.nix")];

    boot = {
      kernelModules = ["kvm-intel"];

      initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];
    };

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/ab2dc6ee-7ca5-4306-80da-43255fabdd75";
        fsType = "ext4";
      };

      "/boot" = {
        device = "/dev/disk/by-uuid/86F4-D550";
        fsType = "vfat";

        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };
    };

    swapDevices = [{device = "/dev/disk/by-uuid/f21c6765-340e-4bbd-8a13-d902376a5430";}];
    networking.useDHCP = lib.modules.mkDefault true;

    hardware = {
      cpu.intel.updateMicrocode = lib.modules.mkDefault config.hardware.enableRedistributableFirmware;

      nvidia = {
        modesetting.enable = true;
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };

    services.xserver.videoDrivers = ["nvidia"];
  };
}
