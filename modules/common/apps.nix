{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    calibre
    jellyfin-media-player
    nicotine-plus
    obsidian
  ];
}
