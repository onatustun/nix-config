{
  flake.modules.homeManager = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.zsh;
    };

    zsh.programs.zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}
