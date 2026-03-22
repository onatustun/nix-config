{
  inputs,
  lib,
  ...
}: {
  imports = lib.lists.singleton inputs.make-shell.flakeModules.default;

  perSystem = {
    self',
    config,
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = self'.devShells.nix-config;

    make-shells.nix-config = {
      shellHook = config.pre-commit.installationScript;

      inputsFrom = [
        config.pre-commit.devShell
        config.treefmt.build.devShell
      ];

      packages = [
        inputs'.determinate.packages.default
        pkgs.git
        pkgs.vim
      ];
    };
  };
}
