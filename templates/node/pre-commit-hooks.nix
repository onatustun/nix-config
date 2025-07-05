{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem.pre-commit.settings = {
    excludes = [
      "flake.lock"
      "^node_modules/"
    ];

    hooks = {
      alejandra.enable = true;
      prettier.enable = true;
    };
  };
}
