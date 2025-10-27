{
  lib,
  inputs',
  pkgs,
  isDarwin,
  ...
}: let
  inherit (lib) mkIf makeLibraryPath concatLists;
in {
  environment = {
    variables.LIBRARY_PATH =
      mkIf isDarwin
      <| makeLibraryPath [pkgs.libiconv];

    systemPackages = concatLists [
      (with pkgs; [
        cargo-audit
        cargo-deny
        cargo-expand
        cargo-fuzz
        cargo-nextest
        cargo-watch
        evcxr
        taplo
      ])

      (with inputs'.fenix.packages.complete; [
        cargo
        clippy
        llvm-tools
        rust-analyzer
        rustc
        rustfmt
        rust-src
      ])
    ];
  };
}
