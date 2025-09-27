{
  lib,
  pkgs,
  isDarwin,
  ...
}: let
  inherit (lib) optionalAttrs optionals;
in {
  programs = optionalAttrs (!isDarwin) {
    nano.enable = false;
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
