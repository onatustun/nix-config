{
  flake.modules.homeManager.carapace =
    { lib, config, ... }:
    let
      inherit (lib.strings) concatStringsSep;
      inherit (lib.lists) optional;
    in
    {
      programs = {
        carapace.enable = true;

        nushell.environmentVariables.CARAPACE_BRIDGES = concatStringsSep "," (
          [ "carapace" ]
          ++ optional config.programs.zsh.enable "zsh"
          ++ optional config.programs.fish.enable "fish"
          ++ optional config.programs.bash.enable "bash"
        );
      };
    };
}
