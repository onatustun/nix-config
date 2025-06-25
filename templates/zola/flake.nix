{
  description = "zola environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      perSystem = {
        lib,
        pkgs,
        ...
      }: {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            alejandra
            gnumake
            nil
            nodejs
            nodePackages.prettier
            tailwindcss
            tailwindcss-language-server
            vscode-langservers-extracted
            zola
          ];
        };
      };
    };
}
