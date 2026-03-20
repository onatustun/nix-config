{
  flake.homeModules = {
    shells = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.fish;
    };

    fish.programs.fish = {
      enable = true;
      generateCompletions = true;
    };
  };
}
