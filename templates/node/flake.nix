{
  description = "nodejs typescript environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      imports = let
        inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;
        inherit (inputs.nixpkgs.lib) filter hasSuffix;
      in
        filter (file: !(builtins.elem file [./flake.nix ./shell.nix])) (filter (hasSuffix ".nix") (listFilesRecursive ./.));
    };
}
