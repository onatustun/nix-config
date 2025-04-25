{
  description = "nixos config";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {
    inherit inputs;
  } {
    systems = import inputs.systems;

    perSystem = {
      pkgs,
      ...
    }: {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          git
          home-manager
          nix
          vim
        ];
      };
    };
    
    flake = {
      templates = {
        node.path = ./templates/node;
      };
      
      nixosConfigurations = let
        mkHost = hostName: system: inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${hostName}
            { nixpkgs.config.allowUnfree = true; }
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs system; };
                users.onat = import ./home;
              };
            }
          ];
        };
      in {
        laptop = mkHost "laptop" "x86_64-linux";
      };  
    };
  };
}
