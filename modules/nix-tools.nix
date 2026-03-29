{
  flake.homeModules.nix-tools =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      home.packages = attrValues {
        inherit (pkgs)
          deadnix
          nixfmt
          nix-melt
          nix-search-cli
          noogle-search
          statix
          ;
      };
    };
}
