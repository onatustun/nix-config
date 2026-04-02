{ lib, config, ... }:
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

  partitions.dev.module =
    { lib, ... }:
    let
      inherit (lib.attrsets) optionalAttrs;
      inherit (lib.modules) mkForce;
    in
    {
      debug = true;

      flake = optionalAttrs (builtins ? currentSystem) {
        currentSystem = mkForce config.flake.allSystems.${builtins.currentSystem};
      };
    };
}
