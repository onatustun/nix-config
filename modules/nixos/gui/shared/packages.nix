{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    dunst
    grim
    hyprcursor
    imv
    mpv
    slurp
    wl-clipboard
    wl-clip-persist
    xfce.thunar
  ];
}
