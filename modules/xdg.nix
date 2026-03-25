{
  flake.homeModules.xdg = {
    lib,
    pkgs,
    ...
  }: {
    xdg = {
      enable = true;
      userDirs.createDirectories = true;
      mimeApps.enable = true;
      configFile."mimeapps.list".force = true;
    };

    home.packages = lib.lists.singleton pkgs.xdg-user-dirs;
  };
}
