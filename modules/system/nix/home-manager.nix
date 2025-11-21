{inputs, ...}: {
  imports = [inputs.home-manager.flakeModules.home-manager];

  flake.modules = {
    nixos.home-manager = {
      home-manager,
      type,
      inputs',
      config,
      hmModules,
      username,
      self,
      ...
    }: {
      imports = [home-manager."${type}Modules".home-manager];
      environment.systemPackages = [inputs'.home-manager.packages.default];

      home-manager = {
        users.${username}.imports =
          [self.modules.homeManager.home-manager]
          ++ hmModules;

        useUserPackages = true;
        backupFileExtension = "hmBackup";

        extraSpecialArgs =
          config._module.args
          // config._module.specialArgs
          // {osConfig = config;};
      };
    };

    homeManager.home-manager = {
      lib,
      isStandalone,
      osConfig,
      username,
      homeDir,
      homeVersion,
      ...
    }: {
      programs.home-manager.enable = true;

      nixpkgs = lib.modules.mkIf (!isStandalone) {
        inherit (osConfig.nixpkgs) config overlays;
      };

      home = {
        inherit username;
        sessionVariables.FLAKE = "${homeDir}/nix";
        homeDirectory = homeDir;
        stateVersion = homeVersion;
      };
    };
  };
}
