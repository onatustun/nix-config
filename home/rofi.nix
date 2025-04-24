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
        background-color: transparent;
        font: "JetBrainsMono Nerd Font 12";
        margin: 0;
        padding: 0;
        spacing: 0;
        text-color: ${config.stylix.base16Scheme.base05}; 
      }

      window {
        background-color: ${config.stylix.base16Scheme.base00}; 
        border-color: ${config.stylix.base16Scheme.base0D}; 
        border-radius: 6;
        border: 2px;
        location: center;
        width: 360;
      }

      inputbar {
        children: [ entry ];
        font-size: 20px; 
        padding: 16px;
        spacing: 16px;
      }

      textbox {
        padding: 8px 24px;
      }

      listview {
        columns: 1;
        fixed-height: false;
        lines: 8;
      }

      element {
        background-color: transparent;
        padding: 8px 16px;
        spacing: 16px;
      }

      element selected normal,
      element selected active {
        background-color: ${config.stylix.base16Scheme.base0D}; 
      }
    '';
  };
}
