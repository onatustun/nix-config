{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
  package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.dunst;
in {
  environment.systemPackages = [package];
  home-manager.sharedModules = [{services.dunst = enabled {inherit package;};}];
}
