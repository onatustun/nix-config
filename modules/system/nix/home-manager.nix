{
  flake.modules = {
    nixos.home-manager = {
      lib,
      inputs,
      type,
      inputs',
      config,
      hmModules,
      username,
      self,
      ...
    }: {
      imports = lib.lists.singleton inputs.home-manager."${type}Modules".home-manager;
      environment.systemPackages = lib.lists.singleton inputs'.home-manager.packages.default;

      home-manager = {
        users.${username}.imports =
          lib.lists.singleton self.modules.homeManager.home-manager
          ++ hmModules;

        useUserPackages = true;
        backupFileExtension = "hmBackup";

        extraSpecialArgs =
          config._module.args
          // config._module.specialArgs
          // {
            osConfig = config;
          };
      };
    };

    homeManager.home-manager = {
      osConfig,
      username,
      homeDir,
      homeVersion,
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
        stateVersion = homeVersion;
      };
    };
  };
}
