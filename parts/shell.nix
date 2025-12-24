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

      nix-config = pkgs.mkShellNoCC {
        name = "nix-config-dev";
        shellHook = config.pre-commit.installationScript;

        inputsFrom = [
          config.pre-commit.devShell
          config.treefmt.build.devShell
        ];

        packages = [
          inputs'.deploy-rs.packages.default
          inputs'.determinate.packages.default
          inputs'.disko.packages.default
          inputs'.home-manager.packages.default
          inputs'.nixos-anywhere.packages.default
          inputs'.ragenix.packages.default
          pkgs.git
          pkgs.jujutsu
          pkgs.nh
          pkgs.vim
        ];
      };
    };
  };
}
