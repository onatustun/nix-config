{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.partitions ];

  partitionedAttrs = {
    checks = "dev";
    devShells = "dev";
  };

  partitions.dev.extraInputs =
    inputs.input-filter
      (import inputs.flake-compat { src = inputs.dev-inputs; }).outputs.inputs;
}
