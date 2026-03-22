{
  inputs,
  lib,
  ...
}: {
  imports = lib.lists.singleton inputs.make-shell.flakeModules.default;

  perSystem = {self', ...}: {
    devShells.nix-config = self'.devShells.default;
  };
}
