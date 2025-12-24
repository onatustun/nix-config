{
  flake.modules.homeManager.smooth-scroll = {pkgs, ...}: let
    smooth-scroll = pkgs.stdenvNoCC.mkDerivation {
      pname = "smooth-scroll";
      version = "0.1.0";

      src = pkgs.fetchFromGitHub {
        owner = "thomasschafer";
        repo = "smooth-scroll.hx";
        rev = "1ed8b088e465fb139389c36ad158ba4a2d9e1bbc";
        sha256 = "sha256-4lxGZrT4cEcg3jqae3uJGGGCSy4WeVZeJ0hIApMb7jY=";
      };

      postPatch = ''
        substituteInPlace smooth-scroll.scm \
          --replace-fail '(require "src/utils.scm")' \
                         '(require "smooth-scroll/src/utils.scm")'
      '';

      installPhase = ''
        mkdir -p $out/share/steel/cogs/smooth-scroll
        cp -r . $out/share/steel/cogs/smooth-scroll
      '';
    };
  in {
    xdg.dataFile."steel/cogs/smooth-scroll" = {
      source = "${smooth-scroll}/share/steel/cogs/smooth-scroll";
      recursive = true;
    };

    programs.helix.settings.keys.normal = {
      C-down = ":half-page-down-smooth";
      C-up = ":half-page-up-smooth";
    };
  };
}
