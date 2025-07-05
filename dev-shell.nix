{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nix-config";
      formatter = pkgs.alejandra;

      packages = with pkgs; [
        alejandra
        home-manager
        nil
        vim
      ];

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
