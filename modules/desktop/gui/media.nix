{
  flake.homeModules = {
    gui = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.media;
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
