{ inputs, system, ... }:

{
  flake.nixosConfigurations = let
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
    laptop = mkHost ./hosts/laptop;
  };
}
