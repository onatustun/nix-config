{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    calibre
    zathura
  ];
}
