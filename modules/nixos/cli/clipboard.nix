{
  inputs',
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs'.nixpkgs-wayland.packages.wl-clipboard
    pkgs.wl-clip-persist
  ];

  home-manager.sharedModules = [{services.cliphist.enable = true;}];
}
