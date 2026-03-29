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

          zephyrDepsHash = "sha256-XRJSmR9wJlBltW5brG4n+IGDVHjFQeqsHMcr/4tvUyI=";

          meta = {
            description = "ZMK firmware";
            license = lib.licenses.mit;
            platforms = lib.platforms.all;
          };
        };

        inherit (inputs'.zmk-nix.packages) update;
        flash = inputs'.zmk-nix.packages.flash.override { inherit (self'.packages) firmware; };
      };

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
