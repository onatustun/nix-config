{
  perSystem = {
    pkgs,
    inputs',
    config,
    lib,
    ...
  }: let
    fenixPkgs = inputs'.fenix.packages.complete;
    inherit (lib) optionals;
    inherit (pkgs.stdenv) isLinux isDarwin;
  in {
    devShells.default = pkgs.mkShell {
      name = "rust";
      formatter = inputs'.alejandra.packages.default;
      shellHook = config.pre-commit.installationScript;
      RUST_SRC_PATH = "${fenixPkgs.rust-src}/lib/rustlib/src/rust/library";

      packages = with pkgs;
        [
          cargo-audit
          cargo-nextest
          cargo-watch
          pkg-config
        ]
        ++ optionals isLinux [pkgs.openssl]
        ++ optionals isDarwin [pkgs.libiconv]
        ++ optionals isDarwin (with pkgs.darwin.apple_sdk.frameworks; [
          Security
          SystemConfiguration
        ])
        ++ (with fenixPkgs; [
          cargo
          clippy
          rust-analyzer
          rustc
          rustfmt
          rust-src
        ])
        ++ (with inputs'; [
          alejandra.packages.default
          deadnix.packages.default
        ]);
    };
  };
}
