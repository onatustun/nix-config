{
  flake.modules.homeManager.cli-utils = {pkgs, ...}: {
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

    home.packages = [
      pkgs.appimage-run
      pkgs.binutils
      pkgs.coreutils-full
      pkgs.curl
      pkgs.diffutils
      pkgs.dust
      pkgs.file
      pkgs.findutils
      pkgs.gawk
      pkgs.gnused
      pkgs.killall
      pkgs.lsof
      pkgs.ouch
      pkgs.procps
      pkgs.rip2
      pkgs.wget
      pkgs.which
      pkgs.yq-go
    ];
  };
}
