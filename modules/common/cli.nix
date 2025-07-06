{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bottom
    fd
    fzf
    git
    killall
    less
    nix-search-cli
    nix-search-tv
    prettyping
    ripgrep
    skim
    yazi
    zoxide
  ];
}
