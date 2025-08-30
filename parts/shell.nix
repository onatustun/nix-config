{
  perSystem = {
    pkgs,
    config,
    inputs',
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nix-config-shell";

      shellHook = ''
        export RULES="$(git rev-parse --show-toplevel)/secrets/secrets.nix";
        ${config.pre-commit.installationScript}
      '';

      inputsFrom = [config.treefmt.build.devShell];

      packages = with pkgs;
        [
          age
          git
          nixos-rebuild
          ssh-to-age
          vim
        ]
        ++ (with inputs'; [
          agenix.packages.default
          alejandra.packages.default
          cachix.packages.default
          comma.packages.default
          deadnix.packages.default
          deploy-rs.packages.default
          determinate.packages.default
          disko.packages.default
          fh.packages.default
          home-manager.packages.default
          nh.packages.default
          nix-index.packages.default
          nixos-anywhere.packages.default
          nixos-generators.packages.default
          statix.packages.default
        ]);
    };
  };
}
