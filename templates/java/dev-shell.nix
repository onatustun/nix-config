{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "java";
      formatter = pkgs.alejandra;

      packages = with pkgs; [
        alejandra
        jdk
        jdt-language-server
        maven
        nil
      ];

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
