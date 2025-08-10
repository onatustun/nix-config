{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {inputs', ...}: {
    pre-commit = {
      check.enable = true;

      settings = {
        package = inputs'.pre-commit-hooks.packages.default;
        excludes = ["flake.lock"];

        hooks = {
          alejandra = {
            enable = true;
            package = inputs'.alejandra.packages.default;
          };

          deadnix = {
            enable = true;
            package = inputs'.deadnix.packages.default;
          };

          clang-format.enable = true;
        };
      };
    };
  };
}
