{ inputs, system, ... }:

{
  flake.devShells.${system}.default =
    let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    pkgs.mkShell {
      # Your shell dependencies and settings go here
      buildInputs = with pkgs; [
        # Example:
        # nodejs
        # git
      ];

      # Example:
      # shellHook = ''
      #   echo "Welcome to the development shell!"
      # '';
    };
}

