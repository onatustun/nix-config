{inputs, ...}: {
  home-manager.sharedModules = [
    inputs.nixcord.homeModules.nixcord

    {
      programs.nixcord = {
        enable = true;

        config = {
          enableReactDevtools = true;

          plugins = {
            blurNSFW.enable = true;
            clearURLs.enable = true;
            experiments.enable = true;
            fakeNitro.enable = true;
            noTypingAnimation.enable = true;
            silentTyping.enable = true;
            translate.enable = true;
            youtubeAdblock.enable = true;
          };
        };
      };
    }
  ];
}
