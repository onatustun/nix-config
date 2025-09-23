{
  description = "nix config";

  nixConfig = {
    extra-substituters = [
      "https://alejandra.cachix.org"
      "https://cache.garnix.io"
      "https://cachix.cachix.org"
      "https://crane.cachix.org"
      "https://deadnix.cachix.org"
      "https://devenv.cachix.org"
      "https://flake-parts.cachix.org"
      "https://ghostty.cachix.org"
      "https://helix.cachix.org"
      "https://hercules-ci.cachix.org"
      "https://hyprland.cachix.org"
      "https://lanzaboote.cachix.org"
      "https://naersk.cachix.org"
      "https://niri.cachix.org"
      "https://nix-community.cachix.org"
      "https://nix-darwin.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://numtide.cachix.org"
      "https://pre-commit-hooks.cachix.org"
      "https://statix.cachix.org"
      "https://stylix.cachix.org"
      "https://yazi.cachix.org"
    ];

    extra-trusted-public-keys = [
      "alejandra.cachix.org-1:NjZ8kI0mf4HCq8yPnBfiTurb96zp1TBWl8EC54Pzjm0="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk="
      "deadnix.cachix.org-1:R7kK+K1CLDbLrGph/vSDVxUslAmq8vhpbcz6SH9haJE="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      "flake-parts.cachix.org-1:IlewuHm3lWYND+tOeQC9nySl7JpzTZ4sqkb1eJMafow="
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "hercules-ci.cachix.org-1:ZZeDl9Va+xe9j+KqdzoBZMFJHVQ42Uu/c/1/KMC5Lw0="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "lanzaboote.cachix.org-1:Nt9//zGmqkg1k5iu+B3bkj3OmHKjSw9pvf3faffLLNk="
      "naersk.cachix.org-1:RPZZukECF/0Uq52CdDZq8QDU2z7hUO66jlLTR7LT9W0="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-darwin.cachix.org-1:LxMyKzQk7Uqkc1Pfq5uhm9GSn07xkERpy+7cpwc006A="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
      "statix.cachix.org-1:Z9E/g1YjCjU117QOOt07OjhljCoRZddiAm4VVESvais="
      "stylix.cachix.org-1:iTycMb+viP8aTqhRDvV5qjs1jtNJKH9Jjvqyg4DYxhw="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
    ];

    builders-use-substitutes = true;

    experimental-features = [
      "cgroups"
      "flakes"
      "nix-command"
      "pipe-operators"
    ];

    flake-registry = "";
    http-connections = 50;
    lazy-trees = true;
    show-trace = true;
    use-cgroups = true;

    trusted-users = [
      "@admin"
      "@build"
      "root"
      "@wheel"
    ];

    warn-dirty = false;
  };

  inputs = {
    nix-src = {
      url = "github:determinatesystems/nix-src";

      inputs = {
        flake-parts.follows = "flake-parts";
        git-hooks-nix.follows = "pre-commit-hooks";
        nixpkgs-23-11.follows = "nixpkgs-23-11";
        nixpkgs.follows = "nixpkgs";
        nixpkgs-regression.follows = "nixpkgs-regression";
      };
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-23-11.url = "github:nixos/nixpkgs/a62e6edd6d5e1fa0329b8653c801147986f8d446?narHash=sha256-oamiKNfr2MS6yH64rUn99mIZjc45nGJlj9eGth/3Xuw%3D";
    nixpkgs-regression.url = "github:nixos/nixpkgs/215d4d0fd80ca5163643b03a33fde804a29cc1e2?narHash=sha256-uGJ0VXIhWKGXxkeNnq4TvV3CIOkUJ3PAoLZ3HMzNVMw%3D";

    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";

    lib-aggregate = {
      url = "github:nix-community/lib-aggregate";

      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs-lib.follows = "nixpkgs-lib";
      };
    };

    determinate = {
      url = "https://flakehub.com/f/determinatesystems/determinate/*";

      inputs = {
        nix.follows = "nix-src";
        nixpkgs.follows = "nixpkgs";
      };
    };

    fh = {
      url = "https://flakehub.com/f/DeterminateSystems/fh/*";

      inputs = {
        crane.follows = "crane";
        fenix.follows = "fenix";
        nixpkgs.follows = "nixpkgs";
      };
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-images = {
      url = "github:nix-community/nixos-images";

      inputs = {
        nixos-stable.follows = "nixpkgs-stable";
        nixos-unstable.follows = "nixpkgs";
      };
    };

    nix-vm-test = {
      url = "github:numtide/nix-vm-test";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";

      inputs = {
        disko.follows = "disko";
        flake-parts.follows = "flake-parts";
        nixos-images.follows = "nixos-images";
        nixos-stable.follows = "nixpkgs-stable";
        nixpkgs.follows = "nixpkgs";
        nix-vm-test.follows = "nix-vm-test";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };

    systems.url = "github:nix-systems/default";
    flake-schemas.url = "https://flakehub.com/f/determinatesystems/flake-schemas/=0.1.5.tar.gz";

    jovian = {
      url = "github:jovian-experiments/jovian-nixos";

      inputs = {
        nix-github-actions.follows = "nix-github-actions";
        nixpkgs.follows = "nixpkgs";
      };
    };

    chaotic = {
      url = "github:chaotic-cx/nyx";

      inputs = {
        flake-schemas.follows = "flake-schemas";
        home-manager.follows = "home-manager";
        jovian.follows = "jovian";
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixlib.follows = "nixpkgs-lib";
      };
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };

    nix-output-monitor = {
      url = "github:maralorn/nix-output-monitor";

      inputs = {
        flake-utils.follows = "flake-utils";
        git-hooks.follows = "pre-commit-hooks";
        nixpkgs.follows = "nixpkgs";
      };
    };

    dix = {
      url = "github:faukah/dix";

      inputs = {
        fenix.follows = "fenix";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
    preservation.url = "github:nix-community/preservation";

    lanzaboote = {
      url = "github:nix-community/lanzaboote";

      inputs = {
        crane.follows = "crane";
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        pre-commit-hooks-nix.follows = "pre-commit-hooks";
        rust-overlay.follows = "rust-overlay";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    flake-root.url = "github:srid/flake-root";

    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-github-actions = {
      url = "github:nix-community/nix-github-actions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv = {
      url = "github:cachix/devenv";

      inputs = {
        cachix.follows = "cachix";
        flake-compat.follows = "flake-compat";
        git-hooks.follows = "pre-commit-hooks";
        nixpkgs.follows = "nixpkgs";
      };
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    direnv = {
      url = "github:direnv/direnv";

      inputs = {
        gomod2nix.follows = "gomod2nix";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    nix-direnv = {
      url = "github:nix-community/nix-direnv";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    nixd = {
      url = "github:nix-community/nixd";

      inputs = {
        flake-parts.follows = "flake-parts";
        flake-root.follows = "flake-root";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    alejandra = {
      url = "github:kamadorueda/alejandra";

      inputs = {
        fenix.follows = "fenix";
        flakeCompat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    deadnix = {
      url = "github:astro/deadnix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };

    statix = {
      url = "github:oppiliappan/statix";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    blueprint = {
      url = "github:numtide/blueprint";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt = {
      url = "github:numtide/treefmt";

      inputs = {
        blueprint.follows = "blueprint";
        flake-compat.follows = "flake-compat";
        nix-filter.follows = "nix-filter";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";

      inputs = {
        flake-compat.follows = "flake-compat";
        gitignore.follows = "gitignore";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-melt = {
      url = "github:nix-community/nix-melt";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cachix = {
      url = "github:cachix/cachix";

      inputs = {
        devenv.follows = "devenv";
        flake-compat.follows = "flake-compat";
        git-hooks.follows = "pre-commit-hooks";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-index = {
      url = "github:nix-community/nix-index";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    comma = {
      url = "github:nix-community/comma";

      inputs = {
        flake-compat.follows = "flake-compat";
        naersk.follows = "naersk";
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };

    nix-filter.url = "github:numtide/nix-filter";

    nix-search-tv = {
      url = "github:3timeslazy/nix-search-tv";

      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-search-cli = {
      url = "github:peterldowns/nix-search-cli";

      inputs = {
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
        nix-filter.follows = "nix-filter";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nur = {
      url = "github:nix-community/nur";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    brew-src = {
      url = "github:homebrew/brew";
      flake = false;
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
      inputs.brew-src.follows = "brew-src";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    crane.url = "github:ipetkov/crane";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-analyzer-src = {
      url = "github:rust-lang/rust-analyzer";
      flake = false;
    };

    fenix = {
      url = "github:nix-community/fenix";

      inputs = {
        rust-analyzer-src.follows = "rust-analyzer-src";
        nixpkgs.follows = "nixpkgs";
      };
    };

    naersk = {
      url = "github:nix-community/naersk";

      inputs = {
        fenix.follows = "fenix";
        nixpkgs.follows = "nixpkgs";
      };
    };

    zig = {
      url = "github:mitchellh/zig-overlay";

      inputs = {
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    zon2nix = {
      url = "github:jcollie/zon2nix";

      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    gomod2nix = {
      url = "github:nix-community/gomod2nix";

      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nuenv = {
      url = "github:determinatesystems/nuenv";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };

    hardware.url = "github:nixos/nixos-hardware";

    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    agenix = {
      url = "github:ryantm/agenix";

      inputs = {
        darwin.follows = "nix-darwin";
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    agenix-rekey = {
      url = "github:oddlama/agenix-rekey";

      inputs = {
        devshell.follows = "devshell";
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        pre-commit-hooks.follows = "pre-commit-hooks";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    agenix-shell = {
      url = "github:aciceri/agenix-shell";

      inputs = {
        flake-parts.follows = "flake-parts";
        flake-root.follows = "flake-root";
        git-hooks-nix.follows = "pre-commit-hooks";
        nix-github-actions.follows = "nix-github-actions";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    tailscale = {
      url = "github:tailscale/tailscale";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    fromYaml = {
      url = "github:senchopens/fromyaml";
      flake = false;
    };

    base16 = {
      url = "github:senchopens/base16.nix";
      inputs.fromYaml.follows = "fromYaml";
    };

    tinted-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };

    stylix = {
      url = "github:danth/stylix";

      inputs = {
        base16.follows = "base16";
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        nur.follows = "nur";
        systems.follows = "systems";
        tinted-schemes.follows = "tinted-schemes";
      };
    };

    helix = {
      url = "github:helix-editor/helix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };

    uwu-colors = {
      url = "github:q60/uwu_colors";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };

    yazi = {
      url = "github:sxyazi/yazi";

      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };

    advisory-db = {
      url = "github:rustsec/advisory-db";
      flake = false;
    };

    powertest = {
      url = "github:eza-community/powertest";

      inputs = {
        flake-utils.follows = "flake-utils";
        naersk.follows = "naersk";
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    eza = {
      url = "github:eza-community/eza";

      inputs = {
        advisory-db.follows = "advisory-db";
        flake-utils.follows = "flake-utils";
        naersk.follows = "naersk";
        nixpkgs.follows = "nixpkgs";
        powertest.follows = "powertest";
        pre-commit-hooks.follows = "pre-commit-hooks";
        rust-overlay.follows = "rust-overlay";
        systems.follows = "systems";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    rip2 = {
      url = "github:milescranmer/rip2";

      inputs = {
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        naersk.follows = "naersk";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";

      inputs = {
        flake-compat.follows = "flake-compat";
        lib-aggregate.follows = "lib-aggregate";
        nixpkgs.follows = "nixpkgs";
      };
    };

    xwayland-satellite = {
      url = "github:supreeeme/xwayland-satellite";

      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };

    niri = {
      url = "github:sodiboo/niri-flake";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixpkgs-stable.follows = "nixpkgs-stable";
        xwayland-satellite-unstable.follows = "xwayland-satellite";
      };
    };

    hyprutils = {
      url = "github:hyprwm/hyprutils";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprwayland-scanner = {
      url = "github:hyprwm/hyprwayland-scanner";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprland-protocols = {
      url = "github:hyprwm/hyprland-protocols";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprlang = {
      url = "github:hyprwm/hyprlang";

      inputs = {
        hyprutils.follows = "hyprutils";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprgraphics = {
      url = "github:hyprwm/hyprgraphics";

      inputs = {
        hyprutils.follows = "hyprutils";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprland-qt-support = {
      url = "github:hyprwm/hyprland-qt-support";

      inputs = {
        hyprlang.follows = "hyprlang";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprland-qtutils = {
      url = "github:hyprwm/hyprland-qtutils";

      inputs = {
        hyprland-qt-support.follows = "hyprland-qt-support";
        hyprlang.follows = "hyprlang";
        hyprutils.follows = "hyprutils";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    xdg-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";

      inputs = {
        hyprland-protocols.follows = "hyprland-protocols";
        hyprlang.follows = "hyprlang";
        hyprutils.follows = "hyprutils";
        hyprwayland-scanner.follows = "hyprwayland-scanner";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprcursor = {
      url = "github:hyprwm/hyprcursor";

      inputs = {
        hyprlang.follows = "hyprlang";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    aquamarine = {
      url = "github:hyprwm/aquamarine";

      inputs = {
        hyprutils.follows = "hyprutils";
        hyprwayland-scanner.follows = "hyprwayland-scanner";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprland = {
      url = "github:hyprwm/hyprland";

      inputs = {
        aquamarine.follows = "aquamarine";
        hyprcursor.follows = "hyprcursor";
        hyprgraphics.follows = "hyprgraphics";
        hyprland-protocols.follows = "hyprland-protocols";
        hyprland-qtutils.follows = "hyprland-qtutils";
        hyprlang.follows = "hyprlang";
        hyprutils.follows = "hyprutils";
        hyprwayland-scanner.follows = "hyprwayland-scanner";
        nixpkgs.follows = "nixpkgs";
        pre-commit-hooks.follows = "pre-commit-hooks";
        systems.follows = "systems";
        xdph.follows = "xdg-portal-hyprland";
      };
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";

      inputs = {
        hyprland.follows = "hyprland";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprmon.url = "github:onatustun/hyprmon";

    waybar = {
      url = "github:alexays/waybar";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";

      inputs = {
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
        zig.follows = "zig";
        zon2nix.follows = "zon2nix";
      };
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";

      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixcord = {
      url = "github:kaylorben/nixcord";

      inputs = {
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = inputs @ {
    nixpkgs,
    systems,
    flake-root,
    ...
  }: let
    inherit (nixpkgs.lib) foldl' const;

    libInputs = with inputs; [
      flake-parts
      nix-darwin
      home-manager
    ];

    libs =
      libInputs
      |> map (input:
        input.lib);

    lib' =
      libs
      |> foldl' (acc: lib:
        acc.extend
        <| const
        <| const
        <| lib)
      nixpkgs.lib;

    lib =
      lib'.extend
      <| import ./lib inputs;

    inherit (lib) mkFlake collectNix;
  in
    mkFlake {
      inherit inputs;
      specialArgs = {inherit lib;};
    } {
      debug = true;
      systems = import systems;

      imports =
        [flake-root.flakeModule]
        ++ collectNix ./parts
        ++ [./hosts];
    };
}
