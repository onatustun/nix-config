{
  partitions.dev.module =
    { inputs, ... }:
    {
      imports = [ inputs.make-shell.flakeModules.default ];

      perSystem =
        { pkgs, self', ... }:
        {
          make-shells.default.stdenv = pkgs.stdenvNoCC;
          devShells.nix-config = self'.devShells.default;
        };
    };
}
