{
  inputs,
  ...
}: let
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
}
