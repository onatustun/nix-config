{
  lib,
  pkgs,
  isDarwin,
  ...
}: let
  inherit (lib) optionalAttrs disabled optionals;
in {
  programs = optionalAttrs (!isDarwin) {
    nano = disabled;
  };

  environment.systemPackages = with pkgs;
    [
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
      vim
      wget
      which
      yq-go
    ]
    ++ (optionals (!isDarwin) [psmisc]);
}
