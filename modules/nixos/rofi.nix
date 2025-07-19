{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;

  mkLiteral = value: {
    _type = "literal";
    inherit value;
  };
in {
  home-manager.sharedModules = [
    {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        extraConfig.modi = mkForce "drun";
        font = mkForce "JetBrainsMono Nerd Font Mono 12";
        location = mkForce "center";

        theme = mkForce {
          "*" = {
            "accent-color" = mkLiteral "${config.stylix.base16Scheme.base0D}";
            bg0 = mkLiteral "${config.stylix.base16Scheme.base00}";
            fg0 = mkLiteral "${config.stylix.base16Scheme.base05}";
            "background-color" = mkLiteral "transparent";
            "text-color" = mkLiteral "@fg0";
            margin = mkLiteral "0";
            padding = mkLiteral "0";
            spacing = mkLiteral "0";
          };

          window = {
            width = 360;
            "border-color" = mkLiteral "@accent-color";
            "border-radius" = 0;
            border = mkLiteral "2px";
            "background-color" = mkLiteral "@bg0";
          };

          inputbar = {
            spacing = mkLiteral "8px";
            padding = mkLiteral "8px";
            "background-color" = mkLiteral "@bg0";
          };

          "prompt, entry, element-icon, element-text" = {
            "vertical-align" = mkLiteral "0.5";
          };

          prompt = {
            "text-color" = mkLiteral "@accent-color";
          };

          textbox = {
            padding = mkLiteral "8px";
            "background-color" = mkLiteral "@bg0";
          };

          listview = {
            lines = 8;
            columns = 1;
            "fixed-height" = false;
          };

          element = {
            padding = mkLiteral "8px";
            spacing = mkLiteral "8px";
          };

          "element normal normal" = {
            "text-color" = mkLiteral "@fg0";
          };

          "element normal active" = {
            "text-color" = mkLiteral "@accent-color";
          };

          "element alternate active" = {
            "text-color" = mkLiteral "@accent-color";
          };

          "element selected" = {
            "text-color" = mkLiteral "@bg0";
          };

          "element selected normal, element selected active" = {
            "background-color" = mkLiteral "@accent-color";
          };

          "element-text" = {
            "text-color" = mkLiteral "inherit";
          };
        };
      };
    }
  ];
}
