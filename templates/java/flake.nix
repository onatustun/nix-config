{
  description = "java environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    flake-parts,
    systems,
    ...
  }: let
    inherit (flake-parts.lib) mkFlake;
  in
    mkFlake {inherit inputs;} {
      systems = import systems;

      imports = [
        ./dev-shell.nix
        ./pre-commit-hooks.nix
      ];
    };
}
