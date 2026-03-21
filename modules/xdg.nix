{
  flake.homeModules.xdg = {
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
}
