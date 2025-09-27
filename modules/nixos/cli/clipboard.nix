{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      cliphist
      wl-clip-persist
    ]
    ++ [inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.wl-clipboard];

  home-manager.sharedModules = [{services.cliphist.enable = true;}];
}
