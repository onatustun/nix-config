{
  description = "nix config";

  nixConfig = {
    extra-substituters = [
      "https://alejandra.cachix.org"
      "https://cachix.cachix.org"
      "https://deadnix.cachix.org"
      "https://flake-parts.cachix.org"
      "https://ghostty.cachix.org"
      "https://helix.cachix.org"
      "https://hyprland.cachix.org"
      "https://naersk.cachix.org"
      "https://niri.cachix.org"
      "https://nix-community.cachix.org"
      "https://nix-darwin.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://pre-commit-hooks.cachix.org"
      "https://stylix.cachix.org"
      "https://yazi.cachix.org"
    ];

    extra-trusted-public-keys = [
      "alejandra.cachix.org-1:NjZ8kI0mf4HCq8yPnBfiTurb96zp1TBWl8EC54Pzjm0="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "deadnix.cachix.org-1:R7kK+K1CLDbLrGph/vSDVxUslAmq8vhpbcz6SH9haJE="
      "flake-parts.cachix.org-1:IlewuHm3lWYND+tOeQC9nySl7JpzTZ4sqkb1eJMafow="
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "naersk.cachix.org-1:RPZZukECF/0Uq52CdDZq8QDU2z7hUO66jlLTR7LT9W0="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-darwin.cachix.org-1:LxMyKzQk7Uqkc1Pfq5uhm9GSn07xkERpy+7cpwc006A="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
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
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    determinate = {
      url = "https://flakehub.com/f/determinatesystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";

      inputs = {
        disko.follows = "disko";
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };

    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
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

    flake-checker = {
      url = "github:determinatesystems/flake-checker";

      inputs = {
        fenix.follows = "fenix";
        naersk.follows = "naersk";
        nixpkgs.follows = "nixpkgs";
      };
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
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

    nix-search-cli = {
      url = "github:peterldowns/nix-search-cli";

      inputs = {
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
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

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

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

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
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
      inputs.nixpkgs.follows = "nixpkgs";
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

    tailscale = {
      url = "github:tailscale/tailscale";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    stylix = {
      url = "github:danth/stylix";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        nur.follows = "nur";
        systems.follows = "systems";
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

    eza = {
      url = "github:eza-community/eza";

      inputs = {
        flake-utils.follows = "flake-utils";
        naersk.follows = "naersk";
        nixpkgs.follows = "nixpkgs";
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
        xwayland-satellite-unstable.follows = "xwayland-satellite";
      };
    };

    xdg-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprcursor = {
      url = "github:hyprwm/hyprcursor";

      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprland = {
      url = "github:hyprwm/hyprland";

      inputs = {
        hyprcursor.follows = "hyprcursor";
        nixpkgs.follows = "nixpkgs";
        pre-commit-hooks.follows = "pre-commit-hooks";
        systems.follows = "systems";
      };
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";

      inputs = {
        hyprland.follows = "hyprland";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
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
    inherit (nixpkgs.lib) const composeManyExtensions;

    libInputs = with inputs; [
      deploy-rs
      flake-parts
      home-manager
      nix-darwin
    ];

    libs =
      libInputs
      |> map (input:
        input.lib);

    lib' =
      libs
      |> map (lib:
        const
        <| const
        <| lib)
      |> composeManyExtensions
      |> nixpkgs.lib.extend;

    lib =
      lib'.extend
      <| import ./lib inputs;

    inherit (lib) mkHostSet mapAttrs attrsToList nameValuePair listToAttrs mkFlake collectNix;

    hostsByType = {
      nixosConfigurations = mkHostSet ./hosts/nixos;
      darwinConfigurations = mkHostSet ./hosts/darwin;
    };

    hostConfigs =
      hostsByType.nixosConfigurations
      // hostsByType.darwinConfigurations
      |> attrsToList
      |> map ({
        name,
        value,
      }:
        nameValuePair name value.config)
      |> listToAttrs;

    mkNodes = hosts:
      hosts
      |> mapAttrs (name: cfg: {
        hostname = name;

        profiles.system = {
          user = "root";
          sshUser = "root";

          path =
            lib."${cfg.pkgs.system}".activate."${cfg.class}"
            cfg;
        };
      });

    nodes =
      (hostsByType.nixosConfigurations
        // hostsByType.darwinConfigurations)
      |> mkNodes;
  in
    mkFlake {
      inherit inputs;
      specialArgs = {inherit lib;};
    } {
      debug = true;
      systems = import systems;

      imports =
        [flake-root.flakeModule]
        ++ collectNix ./parts;

      flake =
        hostsByType
        // hostConfigs
        // {deploy.nodes = nodes;};
    };
}
