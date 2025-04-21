{
  pkgs ? import <nixpkgs> {}, 
  ...
}: pkgs.mkShell {
  NIX_CONFIG = "extra-experimental-features = nix-command flakes";

  nativeBuildInputs = with pkgs; [
    nix
    home-manager
    git
  ];

  shellHook = ''
    echo "Entering development shell for your Nix configuration"
  '';
}
