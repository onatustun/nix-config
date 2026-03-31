{ config, ... }:
{
  partitionedAttrs = {
    allSystems = "dev";
    currentSystem = "dev";
    debug = "dev";
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
