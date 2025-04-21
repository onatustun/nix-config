{ 
  pkgs, 
  config,
  ... 
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  xdg.configFile = {
    "rofi/config.rasi".text = ''
      configuration {
        modi: "drun";
      }

      @theme "~/.config/rofi/themes/spotlight-dark" 
    '';

    "rofi/themes/spotlight-dark.rasi".text = ''
      * {
        font: "JetBrainsMono Nerd Font 12";
        background-color: transparent;
        text-color: ${config.stylix.base16Scheme.base05}; 
        margin: 0;
        padding: 0;
        spacing: 0;
      }

      window {
        background-color: ${config.stylix.base16Scheme.base00}; 
        location: center;
        width: 640;
        border-radius: 8;
      }

      inputbar {
        font-size: 20px; 
        padding: 12px;
        spacing: 12px;
        children: [ entry ];
      }

      entry, element-icon, element-text {
        vertical-align: 0.5;
      }

      entry {
        font: inherit;
        placeholder-color: ${config.stylix.base16Scheme.base04}; 
      }

      message {
        border: 2px 0 0;
        border-color: ${config.stylix.base16Scheme.base02}; 
        background-color: ${config.stylix.base16Scheme.base02}; 
      }

      textbox {
        padding: 8px 24px;
      }

      listview {
        lines: 10;
        columns: 1;
        fixed-height: false;
        border: 1px 0 0;
        border-color: ${config.stylix.base16Scheme.base02}; 
      }

      element {
        padding: 8px 16px;
        spacing: 16px;
        background-color: transparent;
        text-color: ${config.stylix.base16Scheme.base05}; 
      }

      element normal active {
        text-color: ${config.stylix.base16Scheme.base0D};
      }

      element alternate active {
        text-color: ${config.stylix.base16Scheme.base0D};
      }

      element selected normal,
      element selected active {
        background-color: ${config.stylix.base16Scheme.base0D}; 
        text-color: ${config.stylix.base16Scheme.base07};       
      }

      element-icon {
        size: 1em;
      }

      element-text {
         text-color: inherit; 
      }
    '';
  };
}
