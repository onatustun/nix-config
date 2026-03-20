{
  flake.homeModules = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.media;
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
