{
  flake.modules.homeManager = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.direnv;
    };

    direnv.programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
