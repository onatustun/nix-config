{
  perSystem = {
    pkgs,
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "empty";
      formatter = pkgs.alejandra;

      packages = with pkgs; [
        alejandra
        nil
      ];

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
