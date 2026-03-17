{
  flake.modules = {
    nixos.nix-index = {
      inputs,
      type,
      self,
      ...
    }: {
      nixpkgs.overlays = [inputs.nix-index-database.overlays.nix-index];
      imports = [inputs.nix-index-database."${type}Modules".nix-index];
      programs.nix-index-database.comma.enable = true;
      home-manager.sharedModules = [self.modules.homeManager.nix-index];
    };

    homeManager.nix-index = {inputs', ...}: {
      programs.nix-index.enable = true;

      xdg.cacheFile."nix-index/files".source =
        inputs'.nix-index-database.packages.nix-index-database;
    };
  };
}
