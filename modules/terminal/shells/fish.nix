{
  flake.modules.homeManager = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.fish;
    };

    fish.programs.fish = {
      enable = true;
      generateCompletions = true;
    };
  };
}
