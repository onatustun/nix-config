{lib, ...}: let
  inherit (lib) collectNix;
in {
  imports =
    collectNix ./nodes
    ++ [
      ./darwin
      ./generator
      ./nixos
    ];
}
