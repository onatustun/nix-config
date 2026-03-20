{moduleWithSystem, ...}: {
  flake = {
    nixosModules = {
      cli = {
        lib,
        inputs,
        ...
      }: {
        imports = lib.lists.singleton inputs.self.nixosModules.nix-index;
      };

      nix-index = {
        lib,
        inputs,
        ...
      }: {
        nixpkgs.overlays = lib.lists.singleton inputs.nix-index-database.overlays.nix-index;
        imports = lib.lists.singleton inputs.nix-index-database.nixosModules.nix-index;
        programs.nix-index-database.comma.enable = true;
        home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.nix-index;
      };
    };

    homeModules.nix-index = moduleWithSystem ({inputs', ...}: {
      programs.nix-index.enable = true;

      xdg.cacheFile."nix-index/files".source =
        inputs'.nix-index-database.packages.nix-index-database;
    });
  };
}
