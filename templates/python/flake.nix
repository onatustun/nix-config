{
  description = "A minimal Python project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        python3
        python3Packages.pip
      ];

      shellHook = ''
        echo "Entering minimal Python development shell for this project"
      '';
    };
  };
}
