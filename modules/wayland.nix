{
  flake.homeModules.wayland =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      home.packages = attrValues {
        inherit (pkgs)
          grim
          slurp
          wlrctl
          wlr-randr
          ;
      };
    };
}
