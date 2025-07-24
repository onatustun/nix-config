{
  perSystem = {
    pkgs,
    inputs',
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "typst";
      formatter = inputs'.alejandra.packages.default;
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs;
        [
          tinymist
          typst
          typstyle
        ]
        ++ (with inputs'; [alejandra.packages.default]);
    };
  };
}
