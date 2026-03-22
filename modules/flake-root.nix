{
  lib,
  inputs,
  ...
}: {
  imports = lib.lists.singleton inputs.flake-root.flakeModule;

  perSystem = {config, ...}: {
    make-shells.default.inputsFrom = lib.lists.singleton config.flake-root.devShell;

    treefmt = {
      inherit (config.flake-root) projectRootFile;
    };
  };
}
