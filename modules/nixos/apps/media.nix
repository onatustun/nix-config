{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    haruna
    imv
    jellyfin-media-player
    mpv
  ];
}
