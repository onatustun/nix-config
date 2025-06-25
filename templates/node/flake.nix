{
  description = "nodejs typescript environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            alejandra
            nil
            nodejs
            nodePackages.prettier
            pnpm
            tailwindcss
            tailwindcss-language-server
            typescript-language-server
            vscode-langservers-extracted
          ];
        };
      };
    };
}
