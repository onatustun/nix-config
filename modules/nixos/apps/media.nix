{
  inputs',
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs'.nixpkgs-wayland.packages.imv
    pkgs.haruna
    pkgs.mpv
  ];
}
