{
  flake.modules = {
    nixos.system = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.xdg;
    };

    homeManager.xdg = {
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
