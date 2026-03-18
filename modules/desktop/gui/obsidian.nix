{
  flake.modules.homeManager = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.obsidian;
    };

    obsidian = {pkgs, ...}: {
      home.packages = [pkgs.obsidian];
    };
  };
}
