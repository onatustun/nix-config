{
  perSystem = {
    pkgs,
    inputs',
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "empty";
      formatter = inputs'.alejandra.packages.default;
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs;
        []
        ++ (with inputs'; [alejandra.packages.default]);
    };
  };
}
