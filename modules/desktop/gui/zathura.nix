{
  flake.modules.homeManager.zathura = {pkgs, ...}: {
    home.packages = [pkgs.zathura];
  };
}
