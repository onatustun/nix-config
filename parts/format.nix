{
  lib,
  inputs,
  ...
}: let
  inherit (lib) enabled;
in {
  imports = [inputs.treefmt-nix.flakeModule];

  perSystem = {
    config,
    inputs',
    ...
  }: {
    formatter = config.treefmt.build.wrapper;

    treefmt = {
      package = inputs'.treefmt.packages.default;
      inherit (config.flake-root) projectRootFile;
      enableDefaultExcludes = true;

      settings.global.excludes = [
        "*.envrc"
        "flake.lock"
      ];

      programs = {
        alejandra = enabled {package = inputs'.alejandra.packages.default;};
        deadnix = enabled {package = inputs'.deadnix.packages.default;};
      };
    };
  };
}
