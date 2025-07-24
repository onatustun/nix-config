{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ffmpeg-full
    scdl
    spotify
    yt-dlp
  ];

  home-manager.sharedModules = [
    inputs.spicetify-nix.homeManagerModules.default

    {
      programs.spicetify = {
        enable = true;

        enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
          adblock
          autoSkipVideo
          hidePodcasts
          shuffle
        ];
      };
    }
  ];
}
