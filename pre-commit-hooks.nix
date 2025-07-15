{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {config, ...}: {
    pre-commit.settings = {
      excludes = ["flake.lock"];
      hooks.alejandra.enable = true;
    };

    checks.pre-commit = config.pre-commit.installationScript;
  };
}
