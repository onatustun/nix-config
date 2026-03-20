{
  flake.homeModules = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.eza;
    };

    eza.programs.eza = {
      enable = true;
      colors = "auto";
      git = true;
      icons = "auto";
    };
  };
}
