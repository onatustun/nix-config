{
  home-manager.sharedModules = [
    {
      programs.eza = {
        enable = true;
        enableFishIntegration = true;
        colors = "auto";
        git = true;
        icons = "auto";
      };
    }
  ];
}