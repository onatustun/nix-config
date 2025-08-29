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
      programs.direnv = enabled {
        package = inputs.direnv.packages.${pkgs.stdenv.hostPlatform.system}.default;
        nix-direnv = enabled {package = inputs.nix-direnv.packages.${pkgs.stdenv.hostPlatform.system}.default;};
        enableNushellIntegration = true;
        silent = true;
      };
    }
  ];
}
