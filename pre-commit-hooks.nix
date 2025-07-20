{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {
    inputs',
    config,
    ...
  }: {
    pre-commit = {
      check.enable = true;

      settings = {
        excludes = ["flake.lock"];

        hooks.alejandra = {
          enable = true;
          package = inputs'.alejandra.packages.default;
        };
      };
    };

    checks.pre-commit = config.pre-commit.installationScript;
  };
}
