{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = [pkgs.xdg-user-dirs];

  home-manager.sharedModules = [
    {
      xdg = enabled {
        userDirs.createDirectories = true;
        mime.enable = true;
        mimeApps = enabled {defaultApplications."inode/directory" = "thunar.desktop";};
      };
    }
  ];
}
