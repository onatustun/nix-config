{
  description = "nixos config";

  inputs = let
    followsNixpkgs = import ./parts/followsNixpkgs.nix;
  in {
    stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    flake-parts = followsNixpkgs "github:hercules-ci/flake-parts";
    systems = followsNixpkgs "github:nix-systems/default";
    home-manager = followsNixpkgs "github:nix-community/home-manager";
    nur = followsNixpkgs "github:nix-community/nur";
    nixos-hardware = followsNixpkgs "github:nixos/nixos-hardware/master";
    nvf = followsNixpkgs "github:notashelf/nvf";
    stylix = followsNixpkgs "github:danth/stylix";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {
    inherit inputs;
  } {
    systems = import inputs.systems;

    imports = [
      ./shell.nix
      ./parts
      ./hosts
    ];
  };
}
