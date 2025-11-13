{
  flake.modules.homeManager.eza = {inputs', ...}: {
    programs.eza = {
      enable = true;
      package = inputs'.eza.packages.default;
      colors = "auto";
      git = true;
      icons = "auto";
    };
  };
}
