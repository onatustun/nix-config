{
  flake.modules.homeManager = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.obsidian;
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
