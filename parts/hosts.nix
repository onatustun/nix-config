{ 
  inputs, 
  ... 
}: {
  flake.nixosConfigurations = let
    mkHost = hostName: system: inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ../hosts/${hostName}
        { nixpkgs.config.allowUnfree = true; }
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs system; };
            users.onat = import ../home;
          };
        }
      ];
    };
  in {
    laptop = mkHost "laptop" "x86_64-linux";
  };
}
