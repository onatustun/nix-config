{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe enabled;
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
      xdg.configFile."nushell/carapace.nu".source =
        pkgs.runCommand "carapace-nushell-config.nu" {
          nativeBuildInputs = [pkgs.carapace pkgs.gnused];
        } ''
          set -euo pipefail
          ${getExe pkgs.carapace} _carapace nushell > $out
          sed -E -i 's/\bget -i\b/get -o/g' $out
        '';

      programs = {
        carapace = enabled {enableNushellIntegration = false;};
        bash = enabled {enableCompletion = true;};
        fish = enabled {generateCompletions = true;};
        zsh = enabled {enableCompletion = true;};
      };
    }
  ];
}
