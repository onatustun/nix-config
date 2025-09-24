{
  lib,
  inputs,
  pkgs,
  homeDir,
  ...
}: let
  inherit (lib) enabled;
  package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  environment.systemPackages = [package];

  home-manager.sharedModules = [
    {
      programs.nh = enabled {
        inherit package;
        flake = "${homeDir}/nix";
        clean = enabled {extraArgs = "--keep-since 4d --keep 3";};
      };
    }
  ];
}
