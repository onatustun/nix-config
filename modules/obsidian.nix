{
  flake.homeModules.obsidian = {pkgs, ...}: {
    home.packages = [pkgs.obsidian];
  };
}
