{
  inputs,
  lib,
  ...
}: {
  imports = lib.lists.singleton inputs.make-shell.flakeModules.default;

  perSystem = {
    self',
    inputs',
    pkgs,
    ...
  }: {
    devShells.nix-config = self'.devShells.default;

    make-shells.default.packages = [
      inputs'.determinate.packages.default
      pkgs.git
      pkgs.vim
    ];
  };
}
