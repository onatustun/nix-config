{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;}
    (inputs.import-tree [
      ./hosts
      ./lib
      ./modules
      ./parts
    ]);

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    systems.url = "github:nix-systems/default-linux";
    flake-root.url = "github:srid/flake-root";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    pre-commit-hooks = {
      url = "github:onatustun/git-hooks.nix/rm-typstfmt";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate = {
      url = "https://flakehub.com/f/determinatesystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
        nixpkgs.follows = "nixpkgs";
      };
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic = {
      url = "github:chaotic-cx/nyx";

      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };

    hardware.url = "github:nixos/nixos-hardware";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
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

    ragenix = {
      url = "github:yaxitech/ragenix";

      inputs = {
        agenix.follows = "agenix";
        nixpkgs.follows = "nixpkgs";
      };
    };

    stylix = {
      url = "github:danth/stylix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        nur.follows = "nur";
      };
    };

    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xwayland-satellite = {
      url = "github:supreeeme/xwayland-satellite";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        xwayland-satellite-unstable.follows = "xwayland-satellite";
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
        systems.follows = "systems";
      };
    };

    xdg-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
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
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
