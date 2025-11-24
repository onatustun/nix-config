{inputs, ...}: {
  imports = [inputs.git-hooks.flakeModule];

  perSystem = {inputs', ...}: {
    pre-commit = {
      check.enable = true;

      settings = {
        package = inputs'.git-hooks.packages.default;

        excludes = [
          "\\.envrc$"
          "flake\\.lock$"
        ];

        hooks = {
          flake-checker.enable = true;
          treefmt.enable = true;
        };
      };
    };
  };
}
