{
  flake.modules = {
    nixos = {
      nix-index = {self, ...}: {
        imports = [self.modules.nixos.nix-index'];
        home-manager.sharedModules = [self.modules.homeManager.nix-index];
      };

      nix-index' = {
        nix-index-database,
        inputs',
        ...
      }: {
        imports = [nix-index-database.nixosModules.nix-index];
        environment.systemPackages = [inputs'.nix-index.packages.default];
        programs.nix-index-database.comma.enable = true;
      };
    };

    homeManager.nix-index = {inputs', ...}: {
      xdg.cacheFile."nix-index/files".source =
        inputs'.nix-index-database.packages.nix-index-database;

      programs.nix-index = {
        enable = true;
        package = inputs'.nix-index.packages.default;
      };
    };
  };
}
