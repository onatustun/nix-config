{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.xdg-user-dirs];

  home-manager.sharedModules = [
    {
      xdg = let
        inherit (lib) enabled;
      in
        enabled {
          userDirs.createDirectories = true;
          mime.enable = true;
          mimeApps = enabled {defaultApplications."inode/directory" = "thunar.desktop";};
        };
    }
  ];
}
