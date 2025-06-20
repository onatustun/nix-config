{inputs, ...}: {
  flake.overlays.default = final: prev:
    {
      bibata-hyprcursor = final.callPackage ./bibata-hyprcursor.nix {};
    }
    // (inputs.niri.overlays.niri final prev);
}
