{moduleWithSystem, ...}: {
  flake = {
    nixosModules.nix-index = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.nix-index-database.nixosModules.nix-index;
      nixpkgs.overlays = lib.lists.singleton inputs.nix-index-database.overlays.nix-index;
      programs.nix-index-database.comma.enable = true;
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.nix-index;
    };

    homeModules.nix-index = moduleWithSystem ({inputs', ...}: {
      programs.nix-index.enable = true;
      xdg.cacheFile."nix-index/files".source = inputs'.nix-index-database.packages.nix-index-database;
    });
  };
}
