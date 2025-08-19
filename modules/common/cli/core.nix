{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) disabled enabled;
in {
  programs.nano = disabled;

  home-manager.sharedModules = [
    {
      programs = {
        bottom = enabled;
        jq = enabled;
        less = enabled;
        vim = enabled;
      };
    }
  ];

  environment.systemPackages = with pkgs; [
    binutils
    coreutils-full
    curl
    diffutils
    file
    findutils
    gawk
    gnugrep
    gnused
    killall
    lsof
    procps
    psmisc
    wget
    which
  ];
}
