{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.wl-clipboard
    pkgs.wl-clip-persist
  ];

  home-manager.sharedModules = [{services.cliphist.enable = true;}];
}
