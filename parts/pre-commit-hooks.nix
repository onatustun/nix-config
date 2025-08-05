{
  inputs,
  lib,
  ...
}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {inputs', ...}: {
    pre-commit = {
      check.enable = true;

      settings = {
        excludes = ["flake.lock"];

        hooks.alejandra = let
          inherit (lib) enabled;
        in
          enabled {package = inputs'.alejandra.packages.default;};
      };
    };
  };
}
