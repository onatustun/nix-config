{
  flake.modules.homeManager = {
    wayland = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.wayland-utils;
    };

    wayland-utils = {pkgs, ...}: {
      home.packages = [
        pkgs.grim
        pkgs.slurp
        pkgs.wlrctl
        pkgs.wlr-randr
      ];
    };
  };
}
