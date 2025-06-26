{
  perSystem = {
    pkgs,
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "typst";
      formatter = pkgs.alejandra;

      packages = with pkgs; [
        alejandra
        nil
        tinymist
        typst
        typstyle
      ];

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
