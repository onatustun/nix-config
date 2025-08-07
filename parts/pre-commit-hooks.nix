{
  lib,
  inputs,
  ...
}: let
  inherit (lib) enabled;
in {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {inputs', ...}: {
    pre-commit = {
      check.enable = true;

      settings = {
        excludes = ["flake.lock"];
        hooks.alejandra = enabled {package = inputs'.alejandra.packages.default;};
      };
    };
  };
}
