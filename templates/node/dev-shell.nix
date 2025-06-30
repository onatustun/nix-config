{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nodejs typescript";
      formatter = pkgs.alejandra;

      packages = with pkgs; [
        alejandra
        nil
        nodejs
        prettierd
        tailwindcss
        tailwindcss-language-server
        typescript-language-server
        vscode-langservers-extracted
      ];

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
