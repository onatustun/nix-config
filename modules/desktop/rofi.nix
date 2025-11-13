{
  flake.modules.homeManager.rofi = {
    lib,
    config,
    ...
  }: {
    programs.rofi = {
      enable = true;
      extraConfig.modi = lib.modules.mkForce "drun";
      font = lib.modules.mkForce "JetBrainsMono Nerd Font Mono 12";
      location = lib.modules.mkForce "center";

      theme = lib.modules.mkForce {
        "*" = {
          "accent-color" = config.lib.formats.rasi.mkLiteral "${config.stylix.base16Scheme.base0D}";
          bg0 = config.lib.formats.rasi.mkLiteral "${config.stylix.base16Scheme.base00}";
          fg0 = config.lib.formats.rasi.mkLiteral "${config.stylix.base16Scheme.base05}";
          "background-color" = config.lib.formats.rasi.mkLiteral "transparent";
          "text-color" = config.lib.formats.rasi.mkLiteral "@fg0";
          margin = config.lib.formats.rasi.mkLiteral "0";
          padding = config.lib.formats.rasi.mkLiteral "0";
          spacing = config.lib.formats.rasi.mkLiteral "0";
        };

        window = {
          width = 360;
          "border-color" = config.lib.formats.rasi.mkLiteral "@accent-color";
          "border-radius" = 0;
          border = config.lib.formats.rasi.mkLiteral "2px";
          "background-color" = config.lib.formats.rasi.mkLiteral "@bg0";
        };

        inputbar = {
          spacing = config.lib.formats.rasi.mkLiteral "8px";
          padding = config.lib.formats.rasi.mkLiteral "8px";
          "background-color" = config.lib.formats.rasi.mkLiteral "@bg0";
        };

        "prompt, entry, element-icon, element-text" = {
          "vertical-align" = config.lib.formats.rasi.mkLiteral "0.5";
        };

        prompt = {
          "text-color" = config.lib.formats.rasi.mkLiteral "@accent-color";
        };

        textbox = {
          padding = config.lib.formats.rasi.mkLiteral "8px";
          "background-color" = config.lib.formats.rasi.mkLiteral "@bg0";
        };

        listview = {
          lines = 8;
          columns = 1;
          "fixed-height" = false;
        };

        element = {
          padding = config.lib.formats.rasi.mkLiteral "8px";
          spacing = config.lib.formats.rasi.mkLiteral "8px";
        };

        "element normal normal" = {
          "text-color" = config.lib.formats.rasi.mkLiteral "@fg0";
        };

        "element normal active" = {
          "text-color" = config.lib.formats.rasi.mkLiteral "@accent-color";
        };

        "element alternate active" = {
          "text-color" = config.lib.formats.rasi.mkLiteral "@accent-color";
        };

        "element selected" = {
          "text-color" = config.lib.formats.rasi.mkLiteral "@bg0";
        };

        "element selected normal, element selected active" = {
          "background-color" = config.lib.formats.rasi.mkLiteral "@accent-color";
        };

        "element-text" = {
          "text-color" = config.lib.formats.rasi.mkLiteral "inherit";
        };
      };
    };
  };
}
