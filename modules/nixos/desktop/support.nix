{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dconf
    geoclue2
    polkit
  ];
}
