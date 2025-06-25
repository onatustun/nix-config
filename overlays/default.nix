{inputs, ...}: {
  flake.overlays.default = final: prev:
    (import ../pkgs {inherit final prev;})
    // (inputs.niri.overlays.niri final prev);
}
