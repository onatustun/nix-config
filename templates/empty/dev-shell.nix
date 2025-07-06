{
  perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "empty";
      formatter = inputs'.alejandra.packages.default;

      packages = with pkgs;
        []
        ++ (with inputs'; [
          alejandra.packages.default
          nixd.packages.default
        ]);

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
