{
  flake.homeModules.cli-nix = {pkgs, ...}: {
    home.packages = [
      pkgs.alejandra
      pkgs.deadnix
      pkgs.nix-melt
      pkgs.nix-search-cli
      pkgs.noogle-search
      pkgs.statix
    ];
  };
}
