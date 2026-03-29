{
  flake.homeModules.wayland =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.grim
        pkgs.slurp
        pkgs.wlrctl
        pkgs.wlr-randr
      ];
    };
}
