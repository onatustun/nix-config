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
          nixos-rebuild
          vim
        ]
        ++ (with inputs'; [
          agenix.packages.default
          alejandra.packages.default
          cachix.packages.default
          comma.packages.default
          deadnix.packages.default
          deploy-rs.packages.default
          devshell.packages.default
          home-manager.packages.default
          nh.packages.default
          nixos-anywhere.packages.default
          nixos-generators.packages.default
          statix.packages.default
        ]);
    };
  };
}
