{
  perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "java";
      formatter = inputs'.alejandra.packages.default;

      packages = with pkgs;
        [
          # gradle
          jdk
          jdt-language-server
          # maven
        ]
        ++ (with inputs'; [
          alejandra.packages.default
        ]);

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
