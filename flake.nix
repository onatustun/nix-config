{
  description = "Nix config";

  nixConfig = rec {
    commit-lockfile-summary = "chore: update `flake.lock`";

    extra-substituters = [
      "https://ghostty.cachix.org"
      "https://helix.cachix.org"
      "https://niri.cachix.org"
      "https://nix-community.cachix.org"
    ];

    extra-trusted-substituters = extra-substituters;

    extra-trusted-public-keys = [
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    extra-experimental-features = [
      "flakes"
      "nix-command"
    ];
  };

  inputs = {
    nixpkgs = {
      type = "tarball";
      url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };

    import-tree = {
      type = "github";
      owner = "vic";
      repo = "import-tree";
    };

    git-hooks = {
      type = "github";
      owner = "cachix";
      repo = "git-hooks.nix";

      inputs = {
        flake-compat.follows = "dep_flake-compat";
        gitignore.follows = "dep_gitignore";
        nixpkgs.follows = "nixpkgs";
      };
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      type = "github";
      owner = "serokell";
      repo = "deploy-rs";

      inputs = {
        flake-compat.follows = "dep_flake-compat";
        nixpkgs.follows = "nixpkgs";
        utils.follows = "dep_flake-utils";
      };
    };

    nur = {
      type = "github";
      owner = "nix-community";
      repo = "nur";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixos-hardware = {
      type = "github";
      owner = "nixos";
      repo = "nixos-hardware";
    };

    nix-index-database = {
      type = "github";
      owner = "nix-community";
      repo = "nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ragenix = {
      type = "github";
      owner = "yaxitech";
      repo = "ragenix";

      inputs = {
        agenix.follows = "dep_agenix";
        crane.follows = "dep_crane";
        flake-utils.follows = "dep_flake-utils";
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "dep_rust-overlay";
      };
    };

    stylix = {
      type = "github";
      owner = "danth";
      repo = "stylix";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        nur.follows = "nur";
        systems.follows = "systems";
      };
    };

    helix = {
      type = "github";
      owner = "helix-editor";
      repo = "helix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "dep_rust-overlay";
      };
    };

    nixd = {
      type = "github";
      owner = "nix-community";
      repo = "nixd";

      inputs = {
        flake-parts.follows = "flake-parts";
        flake-root.follows = "flake-root";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    xwayland-satellite = {
      type = "github";
      owner = "supreeeme";
      repo = "xwayland-satellite";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "dep_rust-overlay";
      };
    };

    niri = {
      type = "github";
      owner = "sodiboo";
      repo = "niri-flake";

      inputs = {
        niri-stable.follows = "";
        nixpkgs.follows = "nixpkgs";
        nixpkgs-stable.follows = "";
        xwayland-satellite-stable.follows = "";
        xwayland-satellite-unstable.follows = "xwayland-satellite";
      };
    };

    noctalia = {
      type = "github";
      owner = "noctalia-dev";
      repo = "noctalia-shell";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        noctalia-qs.follows = "dep_noctalia-qs";
      };
    };

    ghostty = {
      type = "github";
      owner = "ghostty-org";
      repo = "ghostty";

      inputs = {
        flake-compat.follows = "dep_flake-compat";
        flake-utils.follows = "dep_flake-utils";
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
        zig.follows = "dep_zig-overlay";
        zon2nix.follows = "dep_zon2nix";
      };
    };

    zen-browser = {
      type = "github";
      owner = "0xc000022070";
      repo = "zen-browser-flake";

      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };

    zmk-nix = {
      type = "github";
      owner = "lilyinstarlight";
      repo = "zmk-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    make-shell = {
      type = "github";
      owner = "nicknovitski";
      repo = "make-shell";
      inputs.flake-compat.follows = "dep_flake-compat";
    };

    flake-root = {
      type = "github";
      owner = "srid";
      repo = "flake-root";
    };

    dep_noctalia-qs = {
      type = "github";
      owner = "noctalia-dev";
      repo = "noctalia-qs";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    dep_flake-compat = {
      type = "github";
      owner = "edolstra";
      repo = "flake-compat";
      flake = false;
    };

    dep_gitignore = {
      type = "github";
      owner = "hercules-ci";
      repo = "gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dep_flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
      inputs.systems.follows = "systems";
    };

    dep_zig-overlay = {
      type = "github";
      owner = "mitchellh";
      repo = "zig-overlay";

      inputs = {
        flake-compat.follows = "dep_flake-compat";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    dep_zon2nix = {
      type = "github";
      owner = "nix-community";
      repo = "zon2nix";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        zig-overlay.follows = "dep_zig-overlay";
      };
    };

    dep_rust-overlay = {
      type = "github";
      owner = "oxalica";
      repo = "rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dep_crane = {
      type = "github";
      owner = "ipetkov";
      repo = "crane";
    };

    dep_agenix = {
      type = "github";
      owner = "ryantm";
      repo = "agenix";

      inputs = {
        darwin.follows = "";
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}
