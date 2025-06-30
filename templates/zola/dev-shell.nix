{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "zola";
      formatter = pkgs.alejandra;

      packages = with pkgs; [
        alejandra
        gnumake
        nil
        nodejs
        prettierd
        tailwindcss
        tailwindcss-language-server
        vscode-langservers-extracted
        zola
      ];

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
