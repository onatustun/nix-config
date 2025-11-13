{
  flake.modules.homeManager.carapace = {
    lib,
    config,
    ...
  }: {
    programs = {
      carapace.enable = true;

      nushell.environmentVariables.CARAPACE_BRIDGES =
        lib.strings.concatStringsSep ","
        (["carapace"]
          ++ lib.lists.optional config.programs.zsh.enable "zsh"
          ++ lib.lists.optional config.programs.fish.enable "fish"
          ++ lib.lists.optional config.programs.bash.enable "bash");
    };
  };
}
