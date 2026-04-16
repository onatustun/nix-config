{ inputs, moduleWithSystem, ... }:
{
  imports = [ inputs.home-manager.flakeModules.home-manager ];

  partitions.dev.module.perSystem =
    { inputs', ... }:
    {
      make-shells.default.packages = [ inputs'.home-manager.packages.default ];
    };

  flake.modules = {
    nixos.home-manager = moduleWithSystem (
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
          users.${username}.imports = [ inputs.self.modules.homeManager.home-manager ];
          extraSpecialArgs = config._module.args // config._module.specialArgs;
          useUserPackages = true;
          backupFileExtension = "hmBackup";
        };
      }
    );

    homeManager.home-manager =
      { username, homeDir, ... }:
      {
        home = {
          inherit username;
          sessionVariables.FLAKE = "${homeDir}/nix";
          homeDirectory = homeDir;
        };

        programs.home-manager.enable = true;
      };
  };
}
