{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    binutils
    bottom
    coreutils-full
    curl
    diffutils
    file
    findutils
    gawk
    git
    gnugrep
    gnused
    jq
    killall
    less
    lsof
    procps
    psmisc
    vim
    wget
    which
  ];
}
