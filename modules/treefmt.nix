{
  lib,
  inputs,
  ...
}: {
  imports = lib.lists.singleton inputs.treefmt-nix.flakeModule;

  perSystem = {
    lib,
    config,
    ...
  }: {
    make-shells.default.inputsFrom = lib.lists.singleton config.treefmt.build.devShell;
    pre-commit.settings.hooks.treefmt.enable = true;

    treefmt = {
      enableDefaultExcludes = true;
      flakeCheck = true;
      flakeFormatter = true;

      programs = {
        alejandra.enable = true;
        deadnix.enable = true;
        statix.enable = true;
      };
    };
  };
}
