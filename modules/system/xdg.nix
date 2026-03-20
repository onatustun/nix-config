{
  flake = {
    nixosModules.system = {
      lib,
      inputs,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.xdg;
    };

    homeModules.xdg = {
      lib,
      pkgs,
      ...
    }: {
      home.packages = lib.lists.singleton pkgs.xdg-user-dirs;

      xdg = {
        enable = true;
        userDirs.createDirectories = true;
        mimeApps.enable = true;
        configFile."mimeapps.list".force = true;
      };
    };
  };
}
