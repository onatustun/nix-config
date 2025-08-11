{
  lib,
  inputs,
  pkgs,
  homeDir,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = [inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default];

  home-manager.sharedModules = [
    {
      programs.nh = enabled {
        package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default;
        flake = "${homeDir}/nix";
        clean = enabled {extraArgs = "--keep-since 4d --keep 3";};
      };
    }
  ];
}
