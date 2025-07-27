{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    appimage-run
    dconf
    geoclue2
    polkit
    zmkBATx
  ];
}
