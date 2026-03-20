{
  flake.homeModules = {
    gui = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.soulseek;
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
