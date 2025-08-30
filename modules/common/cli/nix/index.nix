{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  programs.nix-index-database.comma = enabled;

  home-manager.sharedModules = [
    {
      programs.nix-index = enabled {
        package = inputs.nix-index.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    }
  ];
}
