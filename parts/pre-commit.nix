{inputs, ...}: {
  imports = [inputs.git-hooks.flakeModule];

  perSystem.pre-commit = {
    check.enable = true;

    settings.hooks = {
      flake-checker.enable = true;
      treefmt.enable = true;
    };
  };
}
