throw "Have you forgotten to run nixos-anywhere with `--generate-hardware-config nixos-generate-config ./hardware-configuration.nix`?"
# {
#   lib,
#   modulesPath,
#   ...
# }: {
#   imports = [
#     (modulesPath + "/installer/scan/not-detected.nix")
#     (modulesPath + "/profiles/qemu-guest.nix")
#   ];
#   networking.useDHCP = lib.mkDefault true;
#   nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
# }

