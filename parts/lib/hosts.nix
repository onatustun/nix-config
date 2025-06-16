{inputs, ...}: let
  mkHost = hostName: system: extraModules:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs hostName;
        isLaptop = hostName == "laptop";
      };

      modules =
        [
          ../../hosts/shared
          ../../hosts/${hostName}
          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              extraSpecialArgs = {
                inherit inputs system;
                isLaptop = hostName == "laptop";
              };

              users.onat = import ../../home;
            };
          }
        ]
        ++ extraModules;
    };
in {
  _module.args.mkHost = mkHost;
}
