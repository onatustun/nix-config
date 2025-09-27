{
  home-manager.sharedModules = [
    {
      programs = {
        skim.enable = true;
        ripgrep.enable = true;
        fd.enable = true;
        fzf.enable = true;
      };
    }
  ];
}
