{
  flake.modules.homeManager.cli-nix = {
    inputs',
    pkgs,
    ...
  }: {
    home.packages = [
      inputs'.deploy-rs.packages.default
      inputs'.determinate.packages.default
      inputs'.nixd.packages.default
      inputs'.nixos-anywhere.packages.default
      pkgs.alejandra
      pkgs.comma
      pkgs.nix-melt
      pkgs.nix-search-cli
      pkgs.rip2
    ];
  };
}
