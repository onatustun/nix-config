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

          deadnix = {
            enable = true;
            package = inputs'.deadnix.packages.default;
          };

          clippy = {
            enable = true;
            package = inputs'.fenix.packages.default.clippy;
          };

          rustfmt = {
            enable = true;
            package = inputs'.fenix.packages.default.rustfmt;
          };

          cargo-check.enable = true;
        };
      };
    };
  };
}
