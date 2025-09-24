{lib, ...}: let
  inherit (lib) const;
in {
  perSystem = {inputs', ...}: let
    deadnix =
      inputs'.deadnix.packages.default.overrideAttrs
      <| const {meta.mainProgram = "deadnix";};
  in {packages.deadnix = deadnix;};
}
