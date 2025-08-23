{
  lib,
  inputs,
  ...
}: let
  inherit (lib) darwinSystem' disabled;
in {
  flake.darwinConfigurations = {
    mini = darwinSystem' {
      hostName = "mini";
      system = "aarch64-darwin";
      username = "onat";
      stateVer = 6;
      homeVer = "24.11";

      inputModules = [
        inputs.home-manager.darwinModules.default
        inputs.nix-index-database.darwinModules.nix-index
        inputs.stylix.darwinModules.stylix
      ];

      overlays = [inputs.nuenv.overlays.default];

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
