{
  home-manager.sharedModules = [
    {
      programs.zoxide = {
        enable = true;
        options = ["--cmd cd"];
      };
    }
  ];
}
