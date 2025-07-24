{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    nix-index-database.comma.enable = true;

    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  environment.systemPackages = with pkgs;
    [
      bottom
      fd
      ffmpeg-full
      fzf
      git
      git
      home-manager
      killall
      less
      nixos-rebuild
      nix-search-cli
      nix-search-tv
      prettyping
      ripgrep
      scdl
      skim
      vim
      yazi
      yt-dlp
      zoxide
    ]
    ++ (with inputs; [
      alejandra.packages.${pkgs.stdenv.hostPlatform.system}.default
      comma.packages.${pkgs.stdenv.hostPlatform.system}.default
      deploy-rs.packages.${pkgs.stdenv.hostPlatform.system}.default
      nh.packages.${pkgs.stdenv.hostPlatform.system}.default
      nixd.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-melt.packages.${pkgs.stdenv.hostPlatform.system}.default
      nixos-anywhere.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]);
}
