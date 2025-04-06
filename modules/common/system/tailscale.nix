{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
  package = inputs.tailscale.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  services.tailscale = enabled {inherit package;};
  environment.systemPackages = [package];
}
