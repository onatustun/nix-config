{lib, ...}: let
  inherit (lib) concatLists;
in {
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

        shellHook = ''
          export RULES="$(git rev-parse --show-toplevel)/secrets/secrets.nix";
          export NIX_CONFIG="extra-experimental-features = pipe-operators"
          ${config.pre-commit.installationScript}
        '';

        inputsFrom = concatLists [
          (with config; [
            flake-root.devShell
            pre-commit.devShell
            treefmt.build.devShell
          ])

          (with inputs'; [
            deadnix.devShells
            flake-checker.devShells
          ])
        ];

        packages = concatLists [
          (with inputs'; [
            alejandra.packages.default
            cachix.packages.default
            comma.packages.default
            deploy-rs.packages.default
            determinate.packages.default
            disko.packages.default
            flake-checker.packages.default
            home-manager.packages.default
            nh.packages.default
            nix-index.packages.default
            nixos-anywhere.packages.default
            ragenix.packages.default
          ])

          [config.packages.deadnix]

          (with pkgs; [
            git
            rage
            vim
          ])
        ];
      };
    };
  };
}
