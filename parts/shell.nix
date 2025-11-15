{
  perSystem = {
    self',
    pkgs,
    config,
    inputs',
    ...
  }: {
    devShells = {
      default = self'.devShells.nix-config;

      nix-config = pkgs.mkShell {
        name = "nix-config-dev";
        shellHook = config.pre-commit.installationScript;

        inputsFrom = [
          config.flake-root.devShell
          config.pre-commit.devShell
          config.treefmt.build.devShell
        ];

        packages = [
          inputs'.deploy-rs.packages.default
          inputs'.determinate.packages.default
          inputs'.disko.packages.default
          inputs'.home-manager.packages.default
          inputs'.nixos-anywhere.packages.default
          inputs'.pre-commit-hooks.packages.default
          inputs'.pre-commit-hooks.packages.pre-commit-hooks
          inputs'.ragenix.packages.default
          pkgs.alejandra
          pkgs.deadnix
          pkgs.direnv
          pkgs.flake-checker
          pkgs.git
          pkgs.nh
          pkgs.nix-direnv
          pkgs.nixos-rebuild
          pkgs.rage
          pkgs.statix
          pkgs.vim
        ];
      };
    };
  };
}
