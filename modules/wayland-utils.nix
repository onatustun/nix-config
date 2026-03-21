{
  flake.homeModules.wayland-utils = {pkgs, ...}: {
    home.packages = [
      pkgs.grim
      pkgs.slurp
      pkgs.wlrctl
      pkgs.wlr-randr
    ];
  };
}
