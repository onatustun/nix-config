{ config, ... }:
{
  perSystem =
    {
      inputs',
      lib,
      self',
      ...
    }:
    let
      inherit (inputs'.zmk-nix.legacyPackages) buildSplitKeyboard;
      inherit (lib.fileset)
        toSource
        intersection
        gitTracked
        ;
      root = ./.;
    in
    {
      packages = {
        firmware = buildSplitKeyboard {
          name = "firmware";

          src = toSource {
            inherit root;
            fileset = intersection (gitTracked root) (root + /config);
          };

          board = "nice_nano@2.0.0//zmk";
          shield = "cradio_%PART%";

          zephyrDepsHash = "sha256-JgUJP/Aa3WCeTz9mgR+oJakFWcnxyg9xkjOuYzry3PY=";

          meta = {
            description = "ZMK firmware";
            license = lib.licenses.mit;
            platforms = config.systems;
          };
        };

        inherit (inputs'.zmk-nix.packages) update;
        flash = inputs'.zmk-nix.packages.flash.override { inherit (self'.packages) firmware; };
      };
    };

  partitions.dev.module.perSystem =
    { self', inputs', ... }:
    {
      checks = {
        inherit (self'.packages)
          firmware
          flash
          update
          ;
      };

      make-shells.default.inputsFrom = [ inputs'.zmk-nix.devShells.default ];
    };
}
