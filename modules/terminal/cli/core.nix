{
  flake.modules.homeManager.cli-core = {pkgs, ...}: {
    programs = {
      fd.enable = true;
      fzf.enable = true;
      ripgrep.enable = true;
      skim.enable = true;
    };

    home.packages = [
      pkgs.appimage-run
      pkgs.binutils
      pkgs.bottom
      pkgs.coreutils-full
      pkgs.curl
      pkgs.diffutils
      pkgs.dust
      pkgs.file
      pkgs.findutils
      pkgs.gawk
      pkgs.gnugrep
      pkgs.gnused
      pkgs.jq
      pkgs.killall
      pkgs.less
      pkgs.lsof
      pkgs.ouch
      pkgs.procps
      pkgs.vim
      pkgs.wget
      pkgs.which
      pkgs.yq-go
    ];
  };
}
