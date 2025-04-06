{
  lib,
  modulesPath,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [(modulesPath + "/profiles/qemu-guest.nix")];

  boot = {
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

  networking = {
    useDHCP = mkDefault true;
    firewall.allowedTCPPorts = [80 443];
  };
}
