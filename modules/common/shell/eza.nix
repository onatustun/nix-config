{inputs', ...}: {
  home-manager.sharedModules = [
    {
      programs.eza = {
        enable = true;
        package = inputs'.eza.packages.default;
        colors = "auto";
        git = true;
        icons = "auto";
      };
    }
  ];
}
