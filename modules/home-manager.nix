{
  lib,
  inputs,
  moduleWithSystem,
  ...
}: {
  imports = lib.lists.singleton inputs.home-manager.flakeModules.home-manager;

  perSystem = {
    lib,
    inputs',
    ...
  }: {
    make-shells.nix-config.packages = lib.lists.singleton inputs'.home-manager.packages.default;
  };

  flake = {
    nixosModules.home-manager = moduleWithSystem ({inputs', ...}: {
      lib,
      inputs,
      username,
      config,
      ...
    }: {
      imports = lib.lists.singleton inputs.home-manager.nixosModules.home-manager;
      environment.systemPackages = lib.lists.singleton inputs'.home-manager.packages.default;

      home-manager = {
        users.${username}.imports = lib.lists.singleton inputs.self.homeModules.home-manager;

        useUserPackages = true;
        backupFileExtension = "hmBackup";

        extraSpecialArgs =
          config._module.args
          // config._module.specialArgs;
      };
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
