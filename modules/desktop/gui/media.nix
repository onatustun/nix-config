{
  flake.modules.homeManager.media = {
    inputs',
    pkgs,
    ...
  }: {
    home.packages = [
      inputs'.nixpkgs-wayland.packages.imv
      pkgs.haruna
      pkgs.mpv
    ];
  };
}
