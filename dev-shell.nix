{
  perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nix-config";
      formatter = inputs'.alejandra.packages.default;

      packages = with pkgs;
        [
          home-manager
          vim
        ]
        ++ (with inputs'; [
          alejandra.packages.default
          nil.packages.default
        ]);

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };
  };
}
