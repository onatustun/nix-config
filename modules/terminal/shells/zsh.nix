{
  flake.homeModules = {
    shells = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.zsh;
    };

    zsh.programs.zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}
