{
  partitionedAttrs.formatter = "dev";

  partitions.dev.module =
    { inputs, ... }:
    {
      imports = [ inputs.treefmt-nix.flakeModule ];

      perSystem =
        { config, ... }:
        {
          make-shells.default.inputsFrom = [ config.treefmt.build.devShell ];
          pre-commit.settings.hooks.treefmt.enable = true;

          treefmt = {
            enableDefaultExcludes = true;
            flakeCheck = true;
            flakeFormatter = true;

            programs = {
              deadnix.enable = true;
              nixfmt.enable = true;
              statix.enable = true;
            };
          };
        };
    };
}
