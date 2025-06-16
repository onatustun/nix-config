{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {system, ...}: {
    checks.pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
      src = ./.;
      hooks.alejandra.enable = true;
    };

    pre-commit.settings = {
      excludes = ["flake.lock"];
      hooks.alejandra.enable = true;
    };
  };
}
