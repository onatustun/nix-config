{
  flake.overlays.default = final: prev: (import ../pkgs {inherit final prev;});
}
