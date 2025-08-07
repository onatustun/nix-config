{
  description = "rust environment";

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

      inputs = {
        nixpkgs.follows = "nixpkgs";
        fenix.follows = "fenix";
      };
    };

    deadnix = {
      url = "github:astro/deadnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    flake-parts,
    systems,
    ...
  }: let
    lib = nixpkgs.lib
      .extend (_: _: flake-parts.lib);

    inherit (lib) mkFlake;
  in
    mkFlake {
      inherit inputs;
      specialArgs = {inherit lib;};
    } {
      systems = import systems;

      imports = let
        inherit (lib) filesystem filter hasSuffix;
        inherit (filesystem) listFilesRecursive;
      in
        filter (hasSuffix ".nix") (listFilesRecursive ./nix);
    };
}
