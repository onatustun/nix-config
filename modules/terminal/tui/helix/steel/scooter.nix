{
  flake.modules.homeManager.scooter = {pkgs, ...}: let
    scooter = pkgs.rustPlatform.buildRustPackage {
      pname = "scooter.hx";
      version = "0.1.4";

      src = pkgs.fetchFromGitHub {
        owner = "thomasschafer";
        repo = "scooter.hx";
        rev = "36e850cdf782729c2971a3146eec4d662d20409a";
        sha256 = "sha256-gwQVCOa7ll5yx4T9hgVtuehxf7IF+rbIO9EahU6BfzY=";
      };

      cargoHash = "sha256-dGpQXUr+Ny2Kq3S75Qksluy3H8ajec+jsOf/0elSkVs=";

      nativeBuildInputs = [pkgs.autoPatchelfHook];

      buildInputs = [
        pkgs.glibc
        pkgs.stdenv.cc.cc.lib
      ];

      doCheck = false;

      installPhase = ''
        mkdir -p $out/lib $out/share/scooter
        SO_PATH=$(find target -name "libscooter_hx.so" -type f | head -n 1)
        cp "$SO_PATH" $out/lib/libscooter_hx.so
        cp -r ./* $out/share/scooter/
        rm -rf $out/share/scooter/target
      '';
    };
  in {
    xdg.dataFile = {
      "steel/cogs/scooter" = {
        source = "${scooter}/share/scooter";
        recursive = true;
      };

      "steel/native/libscooter_hx.so" = {
        source = "${scooter}/lib/libscooter_hx.so";
        recursive = true;
      };
    };

    programs.helix.settings.keys = {
      normal.C-s = ":scooter";
      insert.C-s = ":scooter";
    };
  };
}
