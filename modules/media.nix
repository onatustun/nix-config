{
  flake.homeModules.media =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      home.packages = attrValues {
        inherit (pkgs)
          ffmpeg-full
          haruna
          imv
          nicotine-plus
          pavucontrol
          playerctl
          pwvucontrol
          scdl
          slsk-batchdl
          slskd
          yt-dlp
          ;
      };

      programs.mpv.enable = true;
    };
}
