{
  flake.modules.homeManager.carapace = {
    lib,
    config,
    ...
  }: {
    programs = {
      carapace.enable = true;

      nushell.environmentVariables.CARAPACE_BRIDGES =
        lib.concatStringsSep ","
        (["carapace"]
          ++ lib.optionals config.programs.zsh.enable ["zsh"]
          ++ lib.optionals config.programs.fish.enable ["fish"]
          ++ lib.optionals config.programs.bash.enable ["bash"]);
    };
  };
}
