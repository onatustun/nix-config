{
  lib,
  inputs,
  pkgs,
  homeDir,
  ...
}: let
  inherit (lib) enabled;
in {
  programs.nh = enabled {
    package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default;
    flake = "${homeDir}/nix";
    clean = enabled {extraArgs = "--keep-since 4d --keep 3";};
  };
}
