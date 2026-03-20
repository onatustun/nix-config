{
  flake.homeModules = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.direnv;
    };

    direnv.programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
