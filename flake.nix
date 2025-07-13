{
  description = "nix config";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
    };

    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };

    hardware = {
      type = "github";
      owner = "nixos";
      repo = "nixos-hardware";
    };

    determinate = {
      type = "tarball";
      url = "https://flakehub.com/f/determinatesystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    system-manager = {
      type = "github";
      owner = "numtide";
      repo = "system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      type = "github";
      owner = "nix-community";
      repo = "nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      type = "github";
      owner = "lnl7";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      type = "github";
      owner = "nix-community";
      repo = "nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      type = "github";
      owner = "nix-community";
      repo = "nur";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    pre-commit-hooks = {
      type = "github";
      owner = "cachix";
      repo = "git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      type = "github";
      owner = "kamadorueda";
      repo = "alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixd = {
      type = "github";
      owner = "nix-community";
      repo = "nixd";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    stylix = {
      type = "github";
      owner = "danth";
      repo = "stylix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
      };
    };

    helix = {
      type = "github";
      owner = "helix-editor";
      repo = "helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    uwu-colors = {
      type = "github";
      owner = "q60";
      repo = "uwu_colors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "github";
      owner = "hyprwm";
      repo = "hyprland";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        pre-commit-hooks.follows = "pre-commit-hooks";
      };
    };

    niri = {
      type = "github";
      owner = "sodiboo";
      repo = "niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      type = "github";
      owner = "ghostty-org";
      repo = "ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      type = "github";
      owner = "0xc000022070";
      repo = "zen-browser-flake";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    spicetify-nix = {
      type = "github";
      owner = "gerg-l";
      repo = "spicetify-nix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    systems,
    nix-darwin,
    ...
  }: let
    inherit (flake-parts.lib) mkFlake;
    inherit (nixpkgs.lib.filesystem) listFilesRecursive;
    inherit (nixpkgs.lib) filter hasSuffix;
  in
    mkFlake {inherit inputs;} {
      systems = import systems;
      flake.lib = nixpkgs.lib.extend (_: _: nix-darwin.lib);

      imports =
        [
          ./dev-shell.nix
          ./hosts
          ./pre-commit-hooks.nix
          ./templates
        ]
        ++ (listFilesRecursive ./lib |> filter (hasSuffix ".nix"));
    };
}
