{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fd
    fzf
    ripgrep
    skim
    yazi
    zoxide
  ];
}
