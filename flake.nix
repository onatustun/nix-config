{
  description = "NixOS configuration";

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

    devShells.${system}.default = import ./shell.nix { inherit pkgs; };
  };
}
