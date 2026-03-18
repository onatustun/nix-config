{
  flake.modules.nixos.hardware-server = {
    lib,
    modulesPath,
    pkgs,
    ...
  }: {
    imports = lib.lists.singleton (modulesPath + "/profiles/qemu-guest.nix");

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader.grub.efiInstallAsRemovable = true;

      initrd.availableKernelModules = [
        "ahci"
        "xhci_pci"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
    };

    networking.firewall.allowedTCPPorts = [80 443];
  };
}
