{
  perSystem = {
    pkgs,
    inputs',
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "java";
      formatter = inputs'.alejandra.packages.default;
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs;
        [
          # gradle
          jdk
          jdt-language-server
          # maven
        ]
        ++ (with inputs'; [alejandra.packages.default]);
    };
  };
}
