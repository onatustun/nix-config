{
  lib,
  inputs,
  ...
}: let
  inherit (lib) enabled;
in {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {
    inputs',
    config,
    ...
  }: {
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
          deadnix = enabled {package = config.packages.deadnix;};
          # flake-checker = enabled {package = inputs'.flake-checker.packages.default;};
          treefmt = enabled;
        };
      };
    };
  };
}
