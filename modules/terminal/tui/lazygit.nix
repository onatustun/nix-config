{
  flake.modules.homeManager.lazygit = {pkgs, ...}: {
    home.packages = [pkgs.lazygit];
  };
}
