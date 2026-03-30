{
  partitions.dev.module =
    { inputs, ... }:
    {
      imports = [ inputs.git-hooks.flakeModule ];

      perSystem =
        { config, ... }:
        {
          make-shells.default = {
            inputsFrom = [ config.pre-commit.devShell ];
            shellHook = config.pre-commit.installationScript;
          };

          pre-commit = {
            check.enable = true;
            settings.hooks.flake-checker.enable = true;
          };
        };
    };
}
