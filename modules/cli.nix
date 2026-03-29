{
  perSystem =
    { pkgs, ... }:
    {
      make-shells.default.packages = [ pkgs.vim ];
    };

  flake.homeModules.cli =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      home.packages = attrValues {
        inherit (pkgs)
          appimage-run
          binutils
          coreutils-full
          curl
          diffutils
          dust
          file
          findutils
          gawk
          gnused
          killall
          lsof
          ouch
          procps
          rip2
          wget
          which
          yq-go
          ;
      };

      programs = {
        fd.enable = true;
        fzf.enable = true;
        grep.enable = true;
        jq.enable = true;
        less.enable = true;
        ripgrep.enable = true;
        skim.enable = true;
        vim.enable = true;
      };
    };
}
