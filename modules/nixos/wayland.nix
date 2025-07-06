{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dunst
    gammastep
    grim
    imv
    mpv
    slurp
    wl-clipboard
    wl-clip-persist
  ];
}
