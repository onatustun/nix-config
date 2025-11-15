{
  flake.modules.homeManager.scooter = {pkgs, ...}: {
    home.packages = [pkgs.scooter];
  };
}
