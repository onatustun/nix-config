{
  flake.modules.homeManager.wayland-core = {
    inputs',
    pkgs,
    ...
  }: {
    home.packages = [
      inputs'.nixpkgs-wayland.packages.grim
      inputs'.nixpkgs-wayland.packages.slurp
      pkgs.wlrctl
      pkgs.wlr-randr
      pkgs.wvkbd
    ];
  };
}
