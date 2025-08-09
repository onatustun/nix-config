{lib, ...}: let
  inherit (lib) collectNix;
in {
  flake.imports =
    collectNix ./deploy
    ++ [
      ./darwin
      ./nixos
    ];
}
