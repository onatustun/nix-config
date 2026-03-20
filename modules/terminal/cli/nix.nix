{
  flake.homeModules = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.cli-nix;
    };

    cli-nix = {pkgs, ...}: {
      home.packages = [
        pkgs.alejandra
        pkgs.deadnix
        pkgs.nix-melt
        pkgs.nix-search-cli
        pkgs.statix
      ];
    };
  };
}
