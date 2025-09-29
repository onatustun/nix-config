{
  lib,
  inputs,
  ...
}: let
  inherit (lib) getExe concatLists;
in {
  imports = [inputs.agenix-shell.flakeModules.default];
  agenix-shell.secrets."github-token".file = ../secrets/common/common/github-token.age;

  perSystem = {
    pkgs,
    config,
    inputs',
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nix-config-dev";

      shellHook = ''
        export RULES="$(git rev-parse --show-toplevel)/secrets/secrets.nix";
        source ${getExe config.agenix-shell.installationScript}
        export NIX_CONFIG="access-tokens = github.com=$github__token extra-experimental-features = pipe-operators"
        ${config.pre-commit.installationScript}
      '';

      inputsFrom = with config; [
        flake-root.devShell
        treefmt.build.devShell
      ];

      packages = concatLists [
        (with pkgs; [
          age
          git
          nixos-rebuild
          ssh-to-age
          vim
        ])

        (with inputs'; [
          agenix.packages.default
          agenix-shell.packages.installationScript
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
        ])

        [config.packages.deadnix]
      ];
    };
  };
}
