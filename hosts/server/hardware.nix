{
  lib,
  modulesPath,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [(modulesPath + "/profiles/qemu-guest.nix")];

  boot.initrd.availableKernelModules = [
    "ahci"
    "xhci_pci"
    "virtio_pci"
    "virtio_scsi"
    "sd_mod"
    "sr_mod"
  ];

  networking.useDHCP = mkDefault true;
  nixpkgs.hostPlatform = mkDefault "x86_64-linux";
}
