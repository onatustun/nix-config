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
        "nixos/system/user.nix"
      ];
    };
  };
}
