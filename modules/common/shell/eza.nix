{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.eza = enabled {
        package = inputs.eza.packages.${pkgs.stdenv.hostPlatform.system}.default;
        colors = "auto";
        git = true;
        icons = "auto";
      };
    }
  ];
}
