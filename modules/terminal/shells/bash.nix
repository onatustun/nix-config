{
  flake.homeModules = {
    shells = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.bash;
    };

    bash.programs.bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
