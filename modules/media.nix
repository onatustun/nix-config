{
  flake.homeModules.media =
    { pkgs, ... }:
    {
      programs.mpv.enable = true;

      home.packages = [
        pkgs.ffmpeg-full
        pkgs.haruna
        pkgs.imv
        pkgs.nicotine-plus
        pkgs.pavucontrol
        pkgs.playerctl
        pkgs.pwvucontrol
        pkgs.scdl
        pkgs.slsk-batchdl
        pkgs.slskd
        pkgs.yt-dlp
      ];
    };
}
