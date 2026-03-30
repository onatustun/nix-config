{
  inputs = {
    make-shell = {
      type = "github";
      owner = "nicknovitski";
      repo = "make-shell";
      inputs.flake-compat.follows = "";
    };

    flake-root = {
      type = "github";
      owner = "srid";
      repo = "flake-root";
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "dep_nixpkgs";
    };

    git-hooks = {
      type = "github";
      owner = "cachix";
      repo = "git-hooks.nix";

      inputs = {
        flake-compat.follows = "";
        gitignore.follows = "dep_gitignore";
        nixpkgs.follows = "dep_nixpkgs";
      };
    };

    dep_nixpkgs = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };

    dep_gitignore = {
      type = "github";
      owner = "hercules-ci";
      repo = "gitignore.nix";
      inputs.nixpkgs.follows = "dep_nixpkgs";
    };
  };

  outputs = _: { };
}
