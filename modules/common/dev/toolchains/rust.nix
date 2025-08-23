{
  pkgs,
  inputs,
  ...
}: let
  fenixPkgs = inputs.fenix.packages.${pkgs.stdenv.hostPlatform.system}.complete;
in {
  environment.systemPackages = with pkgs;
    [
      cargo-audit
      cargo-deny
      cargo-expand
      cargo-fuzz
      cargo-nextest
      cargo-watch
      evcxr
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
}
