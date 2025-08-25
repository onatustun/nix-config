{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) disabled;
in {
  programs.nano = disabled;

  environment.systemPackages = with pkgs; [
    binutils
    bottom
    coreutils-full
    curl
    diffutils
    dust
    file
    findutils
    gawk
    gnugrep
    gnused
    jq
    killall
    less
    lsof
    ouch
    procps
    psmisc
    vim
    wget
    which
    yq-go
  ];
}
