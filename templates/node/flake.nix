{
  description = "node typescript environment";

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

    deadnix = {
      url = "github:astro/deadnix";
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
    mkFlake {inherit inputs;} ({lib, ...}: {
      systems = import systems;

      imports = let
        inherit (lib) filter hasSuffix;
        inherit (lib.filesystem) listFilesRecursive;
      in
        filter (hasSuffix ".nix") (listFilesRecursive ./nix);
    });
}
