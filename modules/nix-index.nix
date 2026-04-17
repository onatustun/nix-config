{ inputs, ... }:
{
  flake.modules.nixos.nix-index = {
    imports = [ inputs.nix-index-database.nixosModules.default ];
    programs.nix-index-database.comma.enable = true;
    home-manager.sharedModules = [ inputs.nix-index-database.homeModules.default ];
  };
}
