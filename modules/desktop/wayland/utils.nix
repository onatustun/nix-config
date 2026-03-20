{
  flake.homeModules = {
    wayland = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.wayland-utils;
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
