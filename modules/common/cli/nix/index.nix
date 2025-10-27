{inputs', ...}: {
  programs.nix-index-database.comma.enable = true;

  home-manager.sharedModules = [
    {
      xdg.cacheFile."nix-index/files".source =
        inputs'.nix-index-database.packages.nix-index-database;

      programs.nix-index = {
        enable = true;
        package = inputs'.nix-index.packages.default;
      };
    }
  ];
}
