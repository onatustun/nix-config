{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.bat = enabled {
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
