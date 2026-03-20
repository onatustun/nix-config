{
  flake.homeModules = {
    shells = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.carapace;
    };

    carapace = {
      lib,
      config,
      ...
    }: {
      programs = {
        carapace.enable = true;

        nushell.environmentVariables.CARAPACE_BRIDGES =
          lib.strings.concatStringsSep ","
          (lib.lists.singleton "carapace"
            ++ lib.lists.optional config.programs.zsh.enable "zsh"
            ++ lib.lists.optional config.programs.fish.enable "fish"
            ++ lib.lists.optional config.programs.bash.enable "bash");
      };
    };
  };
}
