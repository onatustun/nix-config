{
  description = "nodejs typescript environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { 
    inherit inputs; 
  } {
    systems = import inputs.systems;
   
    perSystem = { 
      pkgs,
      ... 
    }: {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          dprint
          nil
          nodejs
          nodePackages.prettier
          nodePackages.typescript-language-server
          pnpm
          tailwindcss-language-server
          vscode-langservers-extracted
        ];
      };
    };
  };
}
