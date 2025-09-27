{
  lib,
  inputs,
  ...
}: let
  inherit (lib) genAttrs const;
in {
  home-manager.sharedModules = [
    inputs.nixcord.homeModules.nixcord

    {
      programs.nixcord = {
        enable = true;

        config = {
          enableReactDevtools = true;

          plugins =
            genAttrs [
              "blurNSFW"
              "clearURLs"
              "experiments"
              "fakeNitro"
              "noTypingAnimation"
              "silentTyping"
              "translate"
              "youtubeAdblock"
            ]
            <| const {enable = true;};
        };
      };
    }
  ];
}
