{lib, ...}: let
  inherit (lib) collectNix;
in {
  imports =
    collectNix ./deploy
    ++ [
      ./darwin
      ./nixos
    ];
}
