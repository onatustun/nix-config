{
  flake.modules.homeManager = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.soulseek;
    };

    soulseek = {pkgs, ...}: {
      home.packages = [
        pkgs.nicotine-plus
        pkgs.slsk-batchdl
        pkgs.slskd
      ];
    };
  };
}
