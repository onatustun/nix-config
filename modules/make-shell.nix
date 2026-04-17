{
  partitions.dev.module =
    { inputs, ... }:
    {
      imports = [ inputs.make-shell.flakeModules.default ];

      perSystem =
        { pkgs, config, ... }:
        {
          make-shells.default.stdenv = pkgs.stdenvNoCC;
          devShells.nix-config = config.devShells.default;
        };
    };
}
