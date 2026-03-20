{
  flake.homeModules = {
    cli = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.eza;
    };

    eza.programs.eza = {
      enable = true;
      colors = "auto";
      git = true;
      icons = "auto";
    };
  };
}
