{
  flake.homeModules = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.fish;
    };

    fish.programs.fish = {
      enable = true;
      generateCompletions = true;
    };
  };
}
