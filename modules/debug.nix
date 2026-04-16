{ lib, ... }:
let
  inherit (lib.attrsets) optionalAttrs;
in
{
  partitionedAttrs = {
    allSystems = "dev";
    debug = "dev";
  }
  // optionalAttrs (builtins ? currentSystem) {
    currentSystem = "dev";
  };

  partitions.dev.module = {
    debug = true;

    flake =
      { lib, config, ... }:
      let
        inherit (lib.attrsets) optionalAttrs;
        inherit (lib.modules) mkForce;
      in
      optionalAttrs (builtins ? currentSystem) {
        currentSystem = mkForce config.allSystems.${builtins.currentSystem};
      };
  };
}
