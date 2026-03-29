{ moduleWithSystem, ... }:
{
  flake = {
    nixosModules.nix-index =
      { inputs, ... }:
      {
        imports = [ inputs.nix-index-database.nixosModules.nix-index ];
        nixpkgs.overlays = [ inputs.nix-index-database.overlays.nix-index ];
        programs.nix-index-database.comma.enable = true;
        home-manager.sharedModules = [ inputs.self.homeModules.nix-index ];
      };

    homeModules.nix-index = moduleWithSystem (
      { inputs', ... }:
      {
        programs.nix-index.enable = true;
        xdg.cacheFile."nix-index/files".source = inputs'.nix-index-database.packages.nix-index-database;
      }
    );
  };
}
