{
  flake.modules.homeManager.scooter = {
    inputs,
    pkgs,
    inputs',
    ...
  }: let
    craneLib =
      (inputs.crane.mkLib pkgs).overrideToolchain
      inputs'.fenix.packages.stable.minimalToolchain;

    pname = "scooter.hx";
    version = "0.1.4";

    commonArgs = {
      inherit pname version;

      src = pkgs.fetchFromGitHub {
        owner = "thomasschafer";
        repo = pname;
        rev = "v${version}";
        sha256 = "sha256-QWFv/Uy3x9O05Rrabo1GjHqva3XJRKALKAUk5RLJdHM=";
      };

      strictDeps = true;
      doCheck = false;
    };

    scooter = craneLib.buildPackage (commonArgs
      // {
        cargoArtifacts = craneLib.buildDepsOnly commonArgs;

        nativeBuildInputs = [
          pkgs.autoPatchelfHook
          pkgs.rsync
        ];

        buildInputs = [pkgs.stdenv.cc.cc.lib];

        installPhase = ''
          mkdir -p $out/lib $out/share/scooter

          cp target/release/libscooter_hx.so $out/lib/

          rsync -a \
            --exclude 'target/' \
            --exclude 'media/' \
            --exclude 'postBuildInstallFromCargoBuildLogOutTemp*' \
            --exclude 'cargoBuildLog*.json' \
            ./ $out/share/scooter/
        '';
      });
  in {
    xdg.dataFile = {
      "steel/cogs/scooter" = {
        source = "${scooter}/share/scooter";
        recursive = true;
      };

      "steel/native/libscooter_hx.so".source = "${scooter}/lib/libscooter_hx.so";
    };

    programs.helix.settings.keys = {
      normal.C-s = ":scooter";
      insert.C-s = ":scooter";
    };
  };
}
