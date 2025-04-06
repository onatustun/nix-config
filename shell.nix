{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    nixpkgs-fmt
    nil
  ];
  
  shellHook = ''
    echo "Nix shell"
  '';
}
