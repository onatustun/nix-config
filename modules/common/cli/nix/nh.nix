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
  environment.systemPackages =
    (with inputs; [
      dix.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-output-monitor.packages.${pkgs.stdenv.hostPlatform.system}.default
    ])
    ++ [
      package
      pkgs.nvd
    ];

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
