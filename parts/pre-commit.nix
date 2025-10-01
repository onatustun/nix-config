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
        package = inputs'.pre-commit-hooks.packages.default;

        excludes = [
          "\\.envrc$"
          "flake\\.lock$"
        ];

        hooks = {
          alejandra = {
            enable = true;
            package = inputs'.alejandra.packages.default;
          };

          deadnix = {
            enable = true;
            package = config.packages.deadnix;
          };

          flake-checker = {
            enable = true;
            package = inputs'.flake-checker.packages.default;
          };

          treefmt.enable = true;
        };
      };
    };
  };
}
