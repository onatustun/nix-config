{
  lib,
  inputs,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    inputs.nixcord.homeModules.nixcord

    {
      programs.nixcord = enabled {
        config = {
          enableReactDevtools = true;

          plugins = {
            blurNSFW = enabled;
            clearURLs = enabled;
            experiments = enabled;
            fakeNitro = enabled;
            noTypingAnimation = enabled;
            silentTyping = enabled;
            translate = enabled;
            youtubeAdblock = enabled;
          };
        };
      };
    }
  ];
}
