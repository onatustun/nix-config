{
  flake.modules.homeManager.wayland-core = {pkgs, ...}: {
    home.packages = [
      pkgs.grim
      pkgs.slurp
      pkgs.wlrctl
      pkgs.wlr-randr
      pkgs.wvkbd
    ];
  };
}
