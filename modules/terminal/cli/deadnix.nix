{
  flake.modules.homeManager.deadnix = {pkgs, ...}: {
    home.packages = [pkgs.deadnix];
  };
}
