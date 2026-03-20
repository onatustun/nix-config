{
  flake.homeModules = {
    tui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.tui-utils;
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
