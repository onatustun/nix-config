{
  flake.modules.homeManager.media = {pkgs, ...}: {
    home.packages = [
      pkgs.haruna
      pkgs.imv
      pkgs.mpv
    ];
  };
}
