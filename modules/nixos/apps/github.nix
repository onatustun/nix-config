{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = [pkgs.github-desktop];
  programs.gh = enabled {settings.git_protocol = "ssh";};
}
