{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs
    pkgs.pnpm
  ];
}
