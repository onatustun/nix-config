{
  flake.homeModules = {
    gui = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.obsidian;
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
