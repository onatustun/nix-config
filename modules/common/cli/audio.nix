{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ffmpeg-full
    scdl
    yt-dlp
  ];
}
