{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {inputs', ...}: {
    pre-commit = {
      check.enable = true;

      settings = {
        excludes = ["flake.lock"];

        hooks = {
          alejandra = {
            enable = true;
            package = inputs'.alejandra.packages.default;
          };

          typstyle.enable = true;
        };
      };
    };
  };
}
