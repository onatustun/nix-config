{
  flake.modules.homeManager = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.media;
    };

    media = {pkgs, ...}: {
      programs.mpv.enable = true;

      home.packages = [
        pkgs.haruna
        pkgs.imv
      ];
    };
  };
}
