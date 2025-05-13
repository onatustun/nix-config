{
  description = "nodejs typescript environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/commit/c0e32b7cfd8b0af5118372db72fd2b9ffab8d9c7";
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
          nodejs
          pnpm
          yarn
        ];
      };
    };
  };
}
