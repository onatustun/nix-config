{
  perSystem = {
    pkgs,
    config,
    ...
  }: {
    formatter = pkgs.alejandra;

    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        git
        home-manager
        nh
        nil
        nix
        vim
      ];

      name = "";
      DIRENV_LOG_FORMAT = "";
      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
