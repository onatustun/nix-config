{lib, ...}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs = {
        carapace = enabled;
        atuin = enabled;
        bash = enabled {enableCompletion = true;};
        fish = enabled {generateCompletions = true;};
        zsh = enabled {enableCompletion = true;};
      };
    }
  ];
}
