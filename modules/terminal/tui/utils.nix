{
  flake.modules.homeManager.tui-utils = {pkgs, ...}: {
    programs = {
      bottom.enable = true;
      btop.enable = true;
      lazygit.enable = true;
    };

    home.packages = [pkgs.scooter];
  };
}
