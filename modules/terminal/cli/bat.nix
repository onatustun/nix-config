{
  flake.modules.homeManager.bat = {pkgs, ...}: {
    programs = {
      ghostty.installBatSyntax = true;

      bat = {
        enable = true;
        config.pager = "less -FR";

        extraPackages = [
          pkgs.bat-extras.batdiff
          pkgs.bat-extras.batman
          pkgs.bat-extras.prettybat
        ];
      };
    };
  };
}
