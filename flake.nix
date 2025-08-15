{
  description = "nix config";

  nixConfig = {
    extra-substituters = [
      "https://alejandra.cachix.org"
      "https://cache.garnix.io"
      "https://cachix.cachix.org"
      "https://flake-parts.cachix.org"
      "https://ghostty.cachix.org"
      "https://helix.cachix.org"
      "https://hercules-ci.cachix.org"
      "https://hyprland.cachix.org"
      "https://niri.cachix.org"
      "https://nix-community.cachix.org"
      "https://nix-darwin.cachix.org"
      "https://numtide.cachix.org"
      "https://pre-commit-hooks.cachix.org"
      "https://stylix.cachix.org"
      "https://system-manager.cachix.org"
    ];

    extra-trusted-public-keys = [
      "alejandra.cachix.org-1:NjZ8kI0mf4HCq8yPnBfiTurb96zp1TBWl8EC54Pzjm0="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "flake-parts.cachix.org-1:IlewuHm3lWYND+tOeQC9nySl7JpzTZ4sqkb1eJMafow="
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "hercules-ci.cachix.org-1:ZZeDl9Va+xe9j+KqdzoBZMFJHVQ42Uu/c/1/KMC5Lw0="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-darwin.cachix.org-1:LxMyKzQk7Uqkc1Pfq5uhm9GSn07xkERpy+7cpwc006A="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
      "stylix.cachix.org-1:iTycMb+viP8aTqhRDvV5qjs1jtNJKH9Jjvqyg4DYxhw="
      "system-manager.cachix.org-1:9ey5QCB09mkShIdY7nKIOj9Gpdzgtd0ssFeq18eCGns="
    ];

    experimental-features = [
      "cgroups"
      "flakes"
      "nix-command"
      "pipe-operators"
    ];

    trusted-users = [
      "@admin"
      "@build"
      "root"
      "@wheel"
    ];

    builders-use-substitutes = true;
    flake-registry = "";
    http-connections = 50;
    lazy-trees = true;
    show-trace = true;
    use-cgroups = true;
    warn-dirty = false;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    determinate = {
      url = "https://flakehub.com/f/determinatesystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # impermanence.url = "github:nix-community/impermanence";

    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        disko.follows = "disko";
      };
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # lanzaboote = {
    #   url = "github:nix-community/lanzaboote";

    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     flake-parts.follows = "flake-parts";
    #   };
    # };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sops-nix = {
    #   url = "github:mic92/sops-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # agenix = {
    #   url = "github:ryantm/agenix";

    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     systems.follows = "systems";
    #     darwin.follows = "nix-darwin";
    #     home-manager.follows = "home-manager";
    #   };
    # };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # treefmt-nix = {
    #   url = "github:numtide/treefmt-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # gitignore = {
    #   url = "github:hercules-ci/gitignore.nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixd = {
      url = "github:nix-community/nixd";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    nix-direnv = {
      url = "github:nix-community/nix-direnv";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    comma = {
      url = "github:nix-community/comma";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-melt = {
      url = "github:nix-community/nix-melt";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/nur";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    stylix = {
      url = "github:danth/stylix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
        nur.follows = "nur";
      };
    };

    uwu-colors = {
      url = "github:q60/uwu_colors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        pre-commit-hooks.follows = "pre-commit-hooks";
      };
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixcord = {
      url = "github:kaylorben/nixcord";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };
  };

  outputs = inputs @ {
    nixpkgs,
    systems,
    ...
  }: let
    inherit (builtins) foldl';
    inherit (nixpkgs.lib) const;

    libInputs = with inputs; [
      flake-parts
      nix-darwin
      system-manager
      home-manager
    ];

    lib' =
      nixpkgs.lib
      |> (acc:
        foldl' (acc: input:
          acc.extend (const
            <| const
            <| input.lib))
        acc
        libInputs);

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
        collectNix ./parts
        ++ [
          ./hosts
          ./templates
        ];
    };
}
