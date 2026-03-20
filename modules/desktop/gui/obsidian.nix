{
  flake.homeModules = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.obsidian;
    };

    obsidian = {
      lib,
      pkgs,
      ...
    }: {
      home.packages = lib.lists.singleton pkgs.obsidian;
    };
  };
}
