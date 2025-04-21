{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = [
    pkgs.git
    pkgs.nixfmt-classic
    pkgs.vim
    pkgs.home-manager
  ];
  shellHook = ''
    echo "Default NixOS config development shell!"
  '';
}
