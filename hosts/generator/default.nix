{
  lib,
  inputs,
  ...
}: let
  inherit (lib) nixosGenerate';
in {
  flake = {
    minimal = nixosGenerate' {
      hostName = "minimal";
      system = "x86_64-linux";
      username = "onat";
      stateVer = "24.11";
      format = "iso";

      inputModules = [inputs.determinate.nixosModules.default];

      modules = [
        "common/system"
        "nixos/security/ssh.nix"
        "nixos/system/boot.nix"
        "nixos/system/kernel.nix"
        "nixos/system/locale.nix"
      ];

      ignore = [
        "agenix.nix"
        "tailscale.nix"
      ];
    };
  };
}
