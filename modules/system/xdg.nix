{
  flake.modules.homeManager.xdg = {pkgs, ...}: {
    home.packages = [pkgs.xdg-user-dirs];

    xdg = {
      enable = true;
      userDirs.createDirectories = true;
      mimeApps.enable = true;
    };
  };
}
