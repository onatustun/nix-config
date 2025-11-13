{
  flake.modules = {
    nixos = {
      stylix = {self, ...}: {
        imports = [self.modules.nixos.stylix'];
        home-manager.sharedModules = [self.modules.homeManager.stylix];
      };

      stylix' = {
        stylix,
        config,
        pkgs,
        ...
      }: {
        imports = [stylix.nixosModules.stylix];

        stylix = {
          enable = true;
          inherit (config.stylix.base16Scheme) polarity;

          base16Scheme = {
            name = "solarized_light";
            polarity = "light";
            base00 = "#fdf6e3";
            base01 = "#eee8d5";
            base02 = "#93a1a1";
            base03 = "#839496";
            base04 = "#657b83";
            base05 = "#586e75";
            base06 = "#073642";
            base07 = "#002b36";
            base08 = "#dc322f";
            base09 = "#cb4b16";
            base0A = "#b58900";
            base0B = "#859900";
            base0C = "#2aa198";
            base0D = "#268bd2";
            base0E = "#6c71c4";
            base0F = "#d33682";
          };

          fonts = {
            sizes.terminal = 14;

            monospace = {
              package = pkgs.nerd-fonts.jetbrains-mono;
              name = "JetBrainsMono Nerd Font Mono";
            };

            sansSerif = {
              package = pkgs.dejavu_fonts;
              name = "DejaVu Sans";
            };

            serif = {
              package = pkgs.dejavu_fonts;
              name = "DejaVu Serif";
            };

            emoji = {
              package = pkgs.noto-fonts-emoji;
              name = "Noto Color Emoji";
            };
          };
        };
      };
    };

    homeManager.stylix = {config, ...}: {
      stylix.targets = {
        helix.enable = false;
        nixcord.enable = false;
        rofi.enable = false;
        spicetify.enable = false;
        tmux.enable = false;
        waybar.enable = false;
        zen-browser.enable = false;
      };

      programs.helix.settings.theme = config.stylix.base16Scheme.name;
    };
  };
}
