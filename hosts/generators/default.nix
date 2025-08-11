{lib, ...}: let
  inherit (lib) nixosGenerate';
in {
  flake = {
    minimal = nixosGenerate' {
      hostName = "minimal";
      system = "x86_64-linux";
      username = "onat";
      stateVer = "24.11";
      format = "iso";
      modules = ["common/system"];
      ignore = ["nixpkgs.nix"];
    };
  };
}
