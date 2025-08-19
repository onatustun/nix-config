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
      check = enabled;

      settings = {
        package = inputs'.pre-commit-hooks.packages.default;
        excludes = ["flake.lock"];

        hooks = {
          alejandra = enabled {package = inputs'.alejandra.packages.default;};
          treefmt = enabled;
        };
      };
    };
  };
}
