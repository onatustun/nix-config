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
          config.packages.deadnix
          inputs'.alejandra.packages.default
          inputs'.deploy-rs.packages.default
          inputs'.determinate.packages.default
          inputs'.disko.packages.default
          inputs'.flake-checker.packages.default
          inputs'.home-manager.packages.default
          inputs'.nh.packages.default
          inputs'.nix-direnv.packages.default
          inputs'.nixos-anywhere.packages.default
          inputs'.pre-commit-hooks.packages.default
          inputs'.pre-commit-hooks.packages.pre-commit-hooks
          inputs'.ragenix.packages.default
          inputs'.statix.packages.default
          pkgs.direnv
          pkgs.git
          pkgs.nixos-rebuild
          pkgs.rage
          pkgs.vim
        ];
      };
    };
  };
}
