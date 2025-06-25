{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem.pre-commit.settings = {
    excludes = ["flake.lock"];
    hooks.alejandra.enable = true;
  };
}
