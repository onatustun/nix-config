{
  flake.homeModules = {
    cli = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.bat;
    };

    bat = {pkgs, ...}: {
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
  };
}
