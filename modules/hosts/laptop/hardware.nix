{
  flake.nixosModules.laptop-hardware =
    {
      lib,
      modulesPath,
      inputs,
      pkgs,
      config,
      ...
    }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        inputs.nixos-hardware.nixosModules.framework-13-7040-amd
      ];

      boot = {
        kernelModules = [ "kvm-amd" ];

        initrd.availableKernelModules = [
          "nvme"
          "xhci_pci"
          "thunderbolt"
          "usb_storage"
          "sd_mod"
        ];
      };

      fileSystems = {
        "/" = {
          device = "/dev/disk/by-uuid/506db6ea-c537-4c30-a710-1aafaef3cf8a";
          fsType = "ext4";
        };

        "/boot" = {
          device = "/dev/disk/by-uuid/CB13-7E41";
          fsType = "vfat";

          options = [
            "fmask=0077"
            "dmask=0077"
          ];
        };
      };

      swapDevices = [ { device = "/dev/disk/by-uuid/f2ce709b-e968-4dbd-b4ce-f8b6f8b81afd"; } ];

      hardware = {
        cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
        framework.enableKmod = true;
      };

      services = {
        fwupd.enable = true;
        power-profiles-daemon.enable = true;
        upower.enable = true;
      };

      environment.systemPackages = attrValues {
        inherit (pkgs)
          framework-tool
          kmod
          microcode-amd
          ;
      };
    };
}
