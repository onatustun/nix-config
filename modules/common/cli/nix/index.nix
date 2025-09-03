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
      home.file.".cache/nix-index/files".source =
        inputs.nix-index-database.packages.${pkgs.stdenv.hostPlatform.system}.nix-index-database;

      programs.nix-index = enabled {
        package = inputs.nix-index.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    }
  ];
}
