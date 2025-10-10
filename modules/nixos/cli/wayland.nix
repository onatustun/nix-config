{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) concatLists;
in {
  environment.systemPackages = concatLists [
    (with inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}; [
      grim
      slurp
    ])

    (with pkgs; [
      wlr-randr
      wlrctl
      wvkbd
    ])
  ];
}
