{
  perSystem = {
    pkgs,
    config,
    inputs',
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nix-config";
      shellHook = config.pre-commit.installationScript;
      inputsFrom = [config.treefmt.build.devShell];

      packages = with pkgs;
        [
          git
          home-manager
          nixos-rebuild
          shellcheck
          vim
        ]
        ++ (with inputs'; [
          alejandra.packages.default
          comma.packages.default
          deadnix.packages.default
          deploy-rs.packages.default
          nh.packages.default
          nixos-anywhere.packages.default
          nixos-generators.packages.default
          statix.packages.default
        ]);
    };
  };
}
