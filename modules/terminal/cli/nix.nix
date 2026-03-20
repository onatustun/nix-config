{
  flake.homeModules = {
    cli = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.cli-nix;
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
