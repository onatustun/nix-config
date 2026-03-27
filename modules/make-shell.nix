{inputs, ...}: {
  imports = [inputs.make-shell.flakeModules.default];

  perSystem = {self', ...}: {
    devShells.nix-config = self'.devShells.default;
  };
}
