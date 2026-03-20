{
  flake.homeModules = {
    gui = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.zathura;
    };

    zathura = {
      programs.zathura.enable = true;
      xdg.mimeApps.defaultApplications."application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}
