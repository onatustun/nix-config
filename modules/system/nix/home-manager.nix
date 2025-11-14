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
        backupFileExtension = "backup";

        extraSpecialArgs =
          config._module.args
          // config._module.specialArgs
          // {osConfig = config;};
      };
    };

    homeManager.home-manager = {
      osConfig,
      homeDir,
      homeVersion,
      ...
    }: {
      programs.home-manager.enable = true;
      nixpkgs = {inherit (osConfig.nixpkgs) config overlays;};

      home = {
        sessionVariables.FLAKE = "${homeDir}/nix";
        homeDirectory = homeDir;
        stateVersion = homeVersion;
      };
    };
  };
}
