{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dunst
    grim
    imv
    mpv
    slurp
  ];
}
