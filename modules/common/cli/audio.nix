{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = with pkgs; [
    ffmpeg-full
    scdl
  ];

  home-manager.sharedModules = [{yt-dlp = enabled;}];
}
