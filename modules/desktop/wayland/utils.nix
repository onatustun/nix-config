{
  flake.homeModules = {
    wayland = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.wayland-utils;
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
