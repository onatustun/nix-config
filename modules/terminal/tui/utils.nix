{
  flake.homeModules = {
    tui = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.tui-utils;
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
