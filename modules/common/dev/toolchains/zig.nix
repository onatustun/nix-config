{
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) concatLists;
in {
  environment.systemPackages = concatLists [
    [pkgs.zls]

    (with inputs; [
      zig.packages.${pkgs.stdenv.hostPlatform.system}.default
      zon2nix.packages.${pkgs.stdenv.hostPlatform.system}.zon2nix
    ])
  ];
}
