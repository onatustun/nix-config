{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      haruna
      jellyfin-media-player
      mpv
    ]
    ++ [inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.imv];
}
