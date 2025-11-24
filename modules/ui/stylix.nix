{
  flake.modules = {
    nixos = {
      stylix = {
        self,
        type,
        ...
      }: {
        imports = [self.modules.${type}.stylix'];
        home-manager.sharedModules = [self.modules.homeManager.stylix];
      };

      stylix' = {
        stylix,
        type,
        config,
        pkgs,
        ...
      }: {
        imports = [stylix."${type}Modules".stylix];

        stylix = {
          enable = true;
          inherit (config.stylix.base16Scheme) polarity;

          base16Scheme = {
            name = "gruber-darker";
            polarity = "dark";
            base00 = "#181818";
            base01 = "#453d41";
            base02 = "#484848";
            base03 = "#52494e";
            base04 = "#e4e4ef";
            base05 = "#f4f4ff";
            base06 = "#f5f5f5";
            base07 = "#e4e4ef";
            base08 = "#f43841";
            base09 = "#c73c3f";
            base0A = "#ffdd33";
            base0B = "#73c936";
            base0C = "#95a99f";
            base0D = "#96a6c8";
            base0E = "#9e95c7";
            base0F = "#cc8c3c";
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
              package = pkgs.noto-fonts-color-emoji;
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
