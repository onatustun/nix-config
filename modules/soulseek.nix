{
  flake.homeModules.soulseek = {pkgs, ...}: {
    home.packages = [
      pkgs.nicotine-plus
      pkgs.slsk-batchdl
      pkgs.slskd
    ];
  };
}
