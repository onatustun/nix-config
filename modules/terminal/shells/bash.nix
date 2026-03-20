{
  flake.homeModules = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.bash;
    };

    bash.programs.bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
