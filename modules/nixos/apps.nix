{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    calibre
    dunst
    haruna
    imv
    jellyfin-media-player
    mpv
    nicotine-plus
    obsidian
    zathura
  ];
}
