{
  flake = {
    nixosModules.stylix =
      { pkgs, inputs, ... }:
      let
        inherit (pkgs) runCommand;

        base16 = import (
          runCommand "base16-to-nix" {
            nativeBuildInputs = [ pkgs.yaml2nix ];
          } "yaml2nix ${pkgs.base16-schemes + "/share/themes/gruber.yaml"} > $out"
        );
      in
      {
        imports = [ inputs.stylix.nixosModules.stylix ];

        stylix = {
          enable = true;
          polarity = base16.variant;

          base16Scheme = base16.palette // {
            name = "gruber-darker";
          };

          fonts = {
            sizes.terminal = 14;

            monospace = {
              package = pkgs.nerd-fonts.jetbrains-mono;
              name = "JetBrainsMono Nerd Font Mono";
            };
          };

          cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
            size = 24;
          };

          icons = {
            enable = true;
            package = pkgs.adwaita-icon-theme;
            dark = "Adwaita-Dark";
            light = "Adwaita-Light";
          };
        };

        home-manager.sharedModules = [ inputs.self.homeModules.stylix ];
      };

    homeModules.stylix =
      { config, ... }:
      {
        stylix.targets = {
          helix.enable = false;
          rofi.enable = false;
          tmux.enable = false;
          waybar.enable = false;
        };

        programs.helix.settings.theme = config.stylix.base16Scheme.name;
      };
  };
}
