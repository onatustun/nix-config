{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [pkgs.spotify];

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
