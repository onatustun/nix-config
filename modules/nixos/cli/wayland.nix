{
  lib,
  inputs',
  pkgs,
  ...
}: let
  inherit (lib) concatLists;
in {
  environment.systemPackages = concatLists [
    (with inputs'.nixpkgs-wayland.packages; [
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
