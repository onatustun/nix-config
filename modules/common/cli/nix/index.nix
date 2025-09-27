{
  inputs,
  pkgs,
  ...
}: {
  programs.nix-index-database.comma.enable = true;

  home-manager.sharedModules = [
    {
      xdg.cacheFile."nix-index/files".source =
        inputs.nix-index-database.packages.${pkgs.stdenv.hostPlatform.system}.nix-index-database;

      programs.nix-index = {
        enable = true;
        package = inputs.nix-index.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    }
  ];
}
