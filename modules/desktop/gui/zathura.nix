{
  flake.modules.homeManager = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.zathura;
    };

    zathura = {
      programs.zathura.enable = true;
      xdg.mimeApps.defaultApplications."application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}
