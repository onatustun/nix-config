{
  lib,
  inputs,
  pkgs,
  isDarwin,
  ...
}: let
  inherit (lib) mkIf makeLibraryPath;
  fenixPkgs = inputs.fenix.packages.${pkgs.stdenv.hostPlatform.system}.complete;
in {
  environment = {
    variables.LIBRARY_PATH =
      mkIf isDarwin
      <| makeLibraryPath [pkgs.libiconv];

    systemPackages = with pkgs;
      [
        cargo-audit
        cargo-deny
        cargo-expand
        cargo-fuzz
        cargo-nextest
        cargo-watch
        evcxr
        taplo
      ]
      ++ (with fenixPkgs; [
        cargo
        clippy
        llvm-tools
        rust-analyzer
        rustc
        rustfmt
        rust-src
      ]);
  };
}
