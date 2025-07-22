{
  perSystem = {
    inputs',
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nix-config";
      formatter = inputs'.alejandra.packages.default;
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs;
        [
          git
          home-manager
          nixos-rebuild
          vim
        ]
        ++ (with inputs'; [
          alejandra.packages.default
          deploy-rs.packages.default
          comma.packages.default
          nh.packages.default
          nixd.packages.default
          nixos-anywhere.packages.default
        ]);
    };
  };
}
