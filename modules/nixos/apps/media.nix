{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      haruna
      mpv
    ]
    ++ [inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.imv];
}
