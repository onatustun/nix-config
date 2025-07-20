{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
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
    ]
    ++ (with inputs; [comma.packages.${pkgs.stdenv.hostPlatform.system}.default]);
}
