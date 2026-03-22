{
  lib,
  inputs,
  ...
}: {
  imports = lib.lists.singleton inputs.git-hooks.flakeModule;

  perSystem = {
    lib,
    config,
    ...
  }: {
    make-shells.default = {
      inputsFrom = lib.lists.singleton config.pre-commit.devShell;
      shellHook = config.pre-commit.installationScript;
    };

    pre-commit = {
      check.enable = true;
      settings.hooks.flake-checker.enable = true;
    };
  };
}
