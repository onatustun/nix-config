{
  inputs,
  moduleWithSystem,
  ...
}: {
  imports = [inputs.home-manager.flakeModules.home-manager];

  perSystem = {inputs', ...}: {
    make-shells.default.packages = [inputs'.home-manager.packages.default];
  };

  flake = {
    nixosModules.home-manager = moduleWithSystem ({inputs', ...}: {
      inputs,
      username,
      config,
      ...
    }: {
      imports = [inputs.home-manager.nixosModules.home-manager];

      home-manager = {
        users.${username}.imports = [inputs.self.homeModules.home-manager];

        useUserPackages = true;
        backupFileExtension = "hmBackup";

        extraSpecialArgs =
          config._module.args
          // config._module.specialArgs;
      };

      environment.systemPackages = [inputs'.home-manager.packages.default];
    });

    homeModules.home-manager = {
      osConfig,
      username,
      homeDir,
      ...
    }: {
      programs.home-manager.enable = true;

      nixpkgs = {
        inherit (osConfig.nixpkgs) config overlays;
      };

      home = {
        inherit username;
        sessionVariables.FLAKE = "${homeDir}/nix";
        homeDirectory = homeDir;
      };
    };
  };
}
