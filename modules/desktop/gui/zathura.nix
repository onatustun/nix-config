{
  flake.homeModules = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.zathura;
    };

    zathura = {
      programs.zathura.enable = true;
      xdg.mimeApps.defaultApplications."application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}
