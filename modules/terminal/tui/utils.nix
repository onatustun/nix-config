{
  flake.modules.homeManager.tui-utils = {pkgs, ...}: {
    programs = {
      bottom.enable = true;
      btop.enable = true;
    };

    home.packages = [pkgs.scooter];
  };
}
