{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = with pkgs; [
    bash
    carapace
    fish
    inshellisense
    zsh
  ];

  home-manager.sharedModules = [
    {
      programs = {
        carapace = enabled {enableNushellIntegration = true;};
        bash = enabled {enableCompletion = true;};
        fish = enabled {generateCompletions = true;};
        zsh = enabled {enableCompletion = true;};
      };
    }
  ];
}
