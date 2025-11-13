{inputs, ...}: {
  imports = [inputs.treefmt-nix.flakeModule];

  perSystem = {
    config,
    inputs',
    ...
  }: {
    formatter = config.treefmt.build.wrapper;

    treefmt = {
      inherit (config.flake-root) projectRootFile;
      flakeCheck = true;
      enableDefaultExcludes = true;

      settings.global.excludes = [
        "*.envrc"
        "flake.lock"
      ];

      programs = {
        alejandra = {
          enable = true;
          package = inputs'.alejandra.packages.default;
        };

        deadnix = {
          enable = true;
          package = config.packages.deadnix;
        };

        statix = {
          enable = true;
          package = inputs'.statix.packages.default;
        };
      };
    };
  };
}
