{
  flake.modules = {
    nixos = {
      cli = {
        lib,
        self,
        type,
        ...
      }: {
        imports = lib.lists.singleton self.modules.${type}.nix-index;
      };

      nix-index = {
        lib,
        inputs,
        type,
        self,
        ...
      }: {
        nixpkgs.overlays = lib.lists.singleton inputs.nix-index-database.overlays.nix-index;
        imports = lib.lists.singleton inputs.nix-index-database."${type}Modules".nix-index;
        programs.nix-index-database.comma.enable = true;
        home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.nix-index;
      };
    };

    homeManager.nix-index = {inputs', ...}: {
      programs.nix-index.enable = true;

      xdg.cacheFile."nix-index/files".source =
        inputs'.nix-index-database.packages.nix-index-database;
    };
  };
}
