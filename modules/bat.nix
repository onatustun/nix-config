{
  flake.modules.homeManager.bat =
    { config, pkgs, ... }:
    {
      programs = {
        ghostty.installBatSyntax = config.programs.ghostty.enable;

        bat = {
          enable = true;
          config.pager = "less -FR";

          extraPackages = [
            pkgs.bat-extras.batdiff
            pkgs.bat-extras.prettybat
          ];
        };
      };
    };
}
