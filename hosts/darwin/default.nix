{
  lib,
  inputs,
  ...
}: let
  inherit (lib) mkDarwin;
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
        "common/archivers"
        "common/bat"
        "common/cli"
        "common/direnv"
        "common/eza"
        "common/fastfetch"
        "common/fish"
        "common/ghostty"
        "common/git"
        "common/helix"
        "common/man"
        "common/nh"
        "common/nixpkgs"
        "common/starship"
        "common/stylix"
        "common/tmux"
        "darwin/homebrew"
        "darwin/menu"
      ];

      extraModules = [
        {nix.enable = false;}
      ];
    };
  };
}
