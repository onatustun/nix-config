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

        excludes = [
          "\\.envrc$"
          "flake\\.lock$"
        ];

        hooks = {
          alejandra = enabled {package = inputs'.alejandra.packages.default;};
          deadnix = enabled {package = inputs'.deadnix.packages.default;};
          treefmt = enabled;
        };
      };
    };
  };
}
