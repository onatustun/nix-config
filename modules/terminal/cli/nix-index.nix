{
  flake.modules = {
    nixos = {
      nix-index = {
        self,
        type,
        ...
      }: {
        imports = [self.modules.${type}.nix-index'];
        home-manager.sharedModules = [self.modules.homeManager.nix-index];
      };

      nix-index' = {
        nix-index-database,
        type,
        ...
      }: {
        nixpkgs.overlays = [nix-index-database.overlays.nix-index];
        imports = [nix-index-database."${type}Modules".nix-index];
        programs.nix-index-database.comma.enable = true;
      };
    };

    homeManager.nix-index = {inputs', ...}: {
      programs.nix-index.enable = true;

      xdg.cacheFile."nix-index/files".source =
        inputs'.nix-index-database.packages.nix-index-database;
    };
  };
}
