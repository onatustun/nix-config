{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        git
        home-manager
        nh
        nil
        nix
        nixos-rebuild
        vim
      ];

      name = "";
      DIRENV_LOG_FORMAT = "";
      shellHook = ''
        ${config.pre-commit.installationScript}
      '';

      formatter = pkgs.alejandra;
    };
  };
}
