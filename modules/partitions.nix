{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.partitions ];

  partitionedAttrs = {
    checks = "dev";
    devShells = "dev";
  };

  partitions.dev.extraInputs =
    inputs.filter-deps
      (import inputs.flake-compat { src = ../dev-inputs; }).outputs.inputs;
}
