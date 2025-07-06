{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    appimage-run
    dconf
    geoclue2
    playerctl
    polkit
    xdg-user-dirs
    zmkBATx
  ];
}
