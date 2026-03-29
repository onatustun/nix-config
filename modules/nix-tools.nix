{
  flake.homeModules.nix-tools =
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
