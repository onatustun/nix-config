{
  flake.homeModules.xdg =
    { pkgs, ... }:
    {
      xdg = {
        enable = true;
        userDirs.createDirectories = true;
        mimeApps.enable = true;
        configFile."mimeapps.list".force = true;
      };

      home.packages = [ pkgs.xdg-user-dirs ];
    };
}
