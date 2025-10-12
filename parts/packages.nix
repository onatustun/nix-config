{lib, ...}: let
  inherit (lib) const;
in {
  perSystem = {inputs', ...}: {
    packages.deadnix =
      inputs'.deadnix.packages.default.overrideAttrs
      <| const {meta.mainProgram = "deadnix";};
  };
}
