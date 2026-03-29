{
  flake.homeModules.cli-nix =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.deadnix
        pkgs.nixfmt
        pkgs.nix-melt
        pkgs.nix-search-cli
        pkgs.noogle-search
        pkgs.statix
      ];
    };
}
