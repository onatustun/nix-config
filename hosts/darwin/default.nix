{
  lib,
  inputs,
  ...
}: let
  inherit (lib) mkDarwin disabled;
in {
  flake.darwinConfigurations = {
    mini = mkDarwin {
      hostName = "mini";
      system = "aarch64-darwin";
      username = "onat";
      stateVer = 6;
      homeVer = "24.11";

      inputModules = [
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-index-database.darwinModules.nix-index
        inputs.stylix.darwinModules.stylix
      ];

      modules = [
        "common"
        "darwin"
      ];

      ignore = [
        "discord.nix"
        "zen.nix"
      ];

      extraModules = [{nix = disabled;}];
    };
  };
}
