{
  flake.modules.nixos.hardware-server = {
    modulesPath,
    pkgs,
    ...
  }: {
    imports = [(modulesPath + "/profiles/qemu-guest.nix")];

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
