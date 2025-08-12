{inputs, ...}: {
  perSystem = {
    pkgs,
    inputs',
    lib,
    ...
  }: let
    inherit (lib) optionals;
    inherit (pkgs.stdenv) isLinux isDarwin;
    toolchain = inputs'.fenix.packages.complete.toolchain;
    craneLib = (inputs.crane.mkLib pkgs).overrideToolchain toolchain;
    inherit (craneLib) cleanCargoSource buildDepsOnly buildPackage;

    buildInputs =
      [pkgs.pkg-config]
      ++ optionals isLinux [pkgs.openssl]
      ++ optionals isDarwin [pkgs.libiconv]
      ++ optionals isDarwin (with pkgs.darwin.apple_sdk.frameworks; [
        Security
        SystemConfiguration
      ]);

    src = cleanCargoSource inputs.self;
    tomlFile = "${inputs.self}/Cargo.toml";

    commonArgs = {
      inherit src buildInputs tomlFile;
      strictDeps = true;
    };

    cargoArtifacts = buildDepsOnly commonArgs;
    my-crate = buildPackage (commonArgs // {inherit cargoArtifacts;});
  in {
    packages.default = my-crate;

    checks = let
      inherit (craneLib) cargoClippy cargoDoc cargoFmt cargoAudit cargoNextest;
    in {
      inherit my-crate;

      clippy = cargoClippy (commonArgs
        // {
          inherit cargoArtifacts;
          cargoClippyExtraArgs = "--all-targets -- --deny warnings";
        });

      doc = cargoDoc (commonArgs // {inherit cargoArtifacts;});
      fmt = cargoFmt {inherit src tomlFile;};
      audit = cargoAudit {inherit src tomlFile;};
      nextest = cargoNextest (commonArgs // {inherit cargoArtifacts;});
    };
  };
}
