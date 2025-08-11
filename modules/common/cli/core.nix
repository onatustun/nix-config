{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bottom
    git
    killall
    less
    vim
  ];
}
