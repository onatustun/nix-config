{ inputs, moduleWithSystem, ... }:
{
  imports = [ inputs.home-manager.flakeModules.home-manager ];

  perSystem =
    { inputs', ... }:
    {
      make-shells.default.packages = [ inputs'.home-manager.packages.default ];
    };

  flake = {
    nixosModules.home-manager = moduleWithSystem (
      { inputs', ... }:
      {
        inputs,
        username,
        config,
        ...
      }:
      {
        imports = [ inputs.home-manager.nixosModules.home-manager ];
        environment.systemPackages = [ inputs'.home-manager.packages.default ];

        home-manager = {
          users.${username}.imports = [ inputs.self.homeModules.home-manager ];
          extraSpecialArgs = config._module.args // config._module.specialArgs;
          useUserPackages = true;
          backupFileExtension = "hmBackup";
        };
      }
    );

    homeModules.home-manager =
      {
        osConfig,
        username,
        homeDir,
        ...
      }:
      {
        nixpkgs = {
          inherit (osConfig.nixpkgs)
            config
            overlays
            ;
        };

        home = {
          inherit username;
          sessionVariables.FLAKE = "${homeDir}/nix";
          homeDirectory = homeDir;
        };

        programs.home-manager.enable = true;
      };
  };
}
