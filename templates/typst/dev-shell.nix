{
  perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "typst";
      formatter = inputs'.alejandra.packages.default;

      packages = with pkgs;
        [
          tinymist
          typst
          typstyle
        ]
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
