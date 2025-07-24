{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {inputs', ...}: {
    pre-commit = {
      check.enable = true;

      settings = {
        excludes = [
          "flake.lock"
          "^node_modules/"
        ];

        hooks = {
          alejandra = {
            enable = true;
            package = inputs'.alejandra.packages.default;
          };

          prettier.enable = true;
        };
      };
    };
  };
}
