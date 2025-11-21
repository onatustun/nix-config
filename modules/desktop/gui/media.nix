{
  flake.modules.homeManager.media = {pkgs, ...}: {
    programs.mpv.enable = true;

    home.packages = [
      pkgs.haruna
      pkgs.imv
    ];
  };
}
