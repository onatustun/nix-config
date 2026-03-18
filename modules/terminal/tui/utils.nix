{
  flake.modules.homeManager = {
    tui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.tui-utils;
    };

    tui-utils = {
      lib,
      pkgs,
      ...
    }: {
      programs = {
        bottom.enable = true;
        btop.enable = true;
      };

      home.packages = lib.lists.singleton pkgs.scooter;
    };
  };
}
