{
  description = "NixOS configuration";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.follows = "unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = inputs: let
    system = "x86_64-linux";

    mkHost = hostPath: inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        hostPath
        { nixpkgs.config.allowUnfree = true; }
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs system; };
            users.onat = import ./home;
            backupFileExtension = "homebackup";
          };
        }
      ];
    };
  in {
    nixosConfigurations = { 
      laptop = mkHost ./hosts/laptop;
    };

    devShells.${system}.default = import ./shell.nix {
      pkgs = inputs.nixpkgs;
    };  
  };
}
