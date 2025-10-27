{
  inputs',
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs'.zig.packages.default
    inputs'.zon2nix.packages.zon2nix
    pkgs.zls
  ];
}
