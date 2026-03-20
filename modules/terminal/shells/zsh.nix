{
  flake.homeModules = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.zsh;
    };

    zsh.programs.zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}
