{
  flake.modules.homeManager.scooter = {pkgs, ...}: let
    scooter = pkgs.stdenvNoCC.mkDerivation {
      pname = "scooter.hx";
      version = "0.1.4";

      src = pkgs.fetchFromGitHub {
        owner = "thomasschafer";
        repo = "scooter.hx";
        rev = "36e850cdf782729c2971a3146eec4d662d20409a";
        sha256 = "sha256-gwQVCOa7ll5yx4T9hgVtuehxf7IF+rbIO9EahU6BfzY=";
      };

      buildInputs = [
        pkgs.cargo
        pkgs.rustc
      ];

      installPhase = ''
        mkdir -p $out/share/steel/cogs/scooter
        cp -r . $out/share/steel/cogs/scooter
      '';
    };
  in {
    xdg.dataFile."steel/cogs/scooter" = {
      source = "${scooter}/share/steel/cogs/scooter";
      recursive = true;
    };

    programs.helix.settings.keys = {
      normal.C-s = ":scooter";
      insert.C-s = ":scooter";
    };
  };
}
