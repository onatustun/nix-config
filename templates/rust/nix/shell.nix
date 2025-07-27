{
  perSystem = {
    pkgs,
    inputs',
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "rust";
      formatter = inputs'.alejandra.packages.default;
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs;
        [cargo-watch]
        ++ (with inputs'.fenix.packages.default; [
          cargo
          clippy
          rust-analyzer
          rustc
          rustfmt
        ])
        ++ (with inputs'; [
          alejandra.packages.default
          deadnix.packages.default
        ]);
    };
  };
}
