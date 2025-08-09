{
  lib,
  inputs,
  ...
}: let
  inherit (lib) mkDarwin;
in {
  darwinConfigurations = {
    mini = mkDarwin {
      hostName = "mini";
      system = "aarch64-darwin";
      username = "onat";
      homeVer = "24.11";

      inputModules = [
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-index-database.darwinModules.nix-index
        inputs.stylix.darwinModules.stylix
      ];

      modules = [
        "common/cli"
        "common/direnv"
        "common/eza"
        "common/fastfetch"
        "common/fish"
        "common/ghostty"
        "common/helix"
        "common/nixpkgs"
        "common/starship"
        "common/stylix"
        "common/tmux"
      ];

      extraModules = [
        {nix.enable = false;}
      ];
    };
  };
}
