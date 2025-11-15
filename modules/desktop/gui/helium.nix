{
  flake.modules.homeManager.helium = {pkgs, ...}: {
    home.packages = [pkgs.nur.repos.forkprince.helium-nightly];
  };
}
