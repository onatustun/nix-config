{
  flake.modules.homeManager.wayland-utils = {pkgs, ...}: {
    home.packages = [
      pkgs.grim
      pkgs.slurp
      pkgs.wlrctl
      pkgs.wlr-randr
      pkgs.wvkbd
    ];
  };
}
