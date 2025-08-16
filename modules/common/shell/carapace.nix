{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe' getExe enabled;
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
      home.file.".config/nushell/carapace.nu".source =
        pkgs.runCommand "carapace-nushell-config.nu" {
          nativeBuildInputs = with pkgs; [
            carapace
            nushell
          ];
        } ''
          ${getExe' pkgs.nushell "nu"} --no-config-file -c '
            ^${getExe pkgs.carapace} _carapace nushell
            | str replace --all --regex "\\bget -i\\b" "get -o"
            | save --raw --force $env.out
          '
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
