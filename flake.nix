{
  description = "nixos config";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {
    inherit inputs;
  } {
    systems = import inputs.systems;

    imports = [
      ./shell.nix
      ./parts
    ];
  };
}
