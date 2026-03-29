{
  flake.homeModules.bat =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      programs = {
        ghostty.installBatSyntax = true;

        bat = {
          enable = true;
          config.pager = "less -FR";

          extraPackages = attrValues {
            inherit (pkgs.bat-extras)
              batdiff
              prettybat
              ;
          };
        };
      };
    };
}
