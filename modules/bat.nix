{pkgs, ...}: {
  home-manager.sharedModules = [
    {
      programs.bat = {
        enable = true;
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
