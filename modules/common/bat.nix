{
  lib,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.bat = let
        inherit (lib) enabled;
      in
        enabled {
          config.pager = "less -FR";

          extraPackages = with pkgs.bat-extras; [
            batdiff
            batman
            prettybat
          ];
        };
    }
  ];
}
