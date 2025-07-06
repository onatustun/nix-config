{
  home-manager.sharedModules = [
    {
      xdg = {
        enable = true;
        userDirs.createDirectories = true;
        mime.enable = true;

        mimeApps = {
          enable = true;
          defaultApplications."inode/directory" = "thunar.desktop";
        };
      };
    }
  ];
}
