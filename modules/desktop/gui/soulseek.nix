{
  flake.homeModules = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.soulseek;
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
