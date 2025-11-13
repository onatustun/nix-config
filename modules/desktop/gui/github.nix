{
  flake.modules.homeManager.github = {pkgs, ...}: {
    home.packages = [pkgs.github-desktop];
  };
}
