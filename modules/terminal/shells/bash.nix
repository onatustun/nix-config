{
  flake.modules.homeManager = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.bash;
    };

    bash.programs.bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
