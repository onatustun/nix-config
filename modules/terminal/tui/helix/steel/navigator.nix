{
  flake.modules.homeManager.navigator = {pkgs, ...}: let
    navigator = pkgs.stdenvNoCC.mkDerivation {
      pname = "hx-tmux-navigator";
      version = "0.1.0";

      src = pkgs.fetchFromGitHub {
        owner = "piotrkwarcinski";
        repo = "hx-tmux-navigator";
        rev = "e6f28c5c7e4182a003e9e0bdddbec6c6284ec621";
        sha256 = "sha256-5NK318B17iJZ81D5svLGnAy/ke8zW5nfEQouzdynlp0=";
      };

      installPhase = ''
        mkdir -p $out/share/steel/cogs/hx-tmux-navigator
        cp -r . $out/share/steel/cogs/hx-tmux-navigator
      '';
    };

    navbinds = {
      C-h = ":navigator.move-left";
      C-l = ":navigator.move-right";
      C-j = ":navigator.move-down";
      C-k = ":navigator.move-up";
    };
  in {
    xdg.dataFile."steel/cogs/hx-tmux-navigator" = {
      source = "${navigator}/share/steel/cogs/hx-tmux-navigator";
      recursive = true;
    };

    programs.helix.settings.keys = {
      insert = navbinds;
      normal = navbinds;
    };
  };
}
