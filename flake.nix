{
  description = "nixos config";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs: let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop
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

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        git 
        home-manager 
        nix 
        vim
      ];
    };

    templates = {
      node = {
        path = ./templates/node;
        description = "node template";
      };
    };
  };
}
