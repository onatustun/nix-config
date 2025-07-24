{
  perSystem = {
    pkgs,
    inputs',
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nodejs typescript";
      formatter = inputs'.alejandra.packages.default;
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs;
        [
          nodejs
          prettierd
          tailwindcss
          tailwindcss-language-server
          typescript-language-server
          vscode-langservers-extracted
        ]
        ++ (with inputs'; [alejandra.packages.default]);
    };
  };
}
