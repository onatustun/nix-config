{
  flake.modules.homeManager = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.eza;
    };

    eza.programs.eza = {
      enable = true;
      colors = "auto";
      git = true;
      icons = "auto";
    };
  };
}
