{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = [pkgs.dunst];
  home-manager.sharedModules = [{services.dunst = enabled;}];
}
