{
  config,
  iconsPath,
  ...
}: ''
  * {
    background: none;
    border-radius: 0;
    border: none;
    box-shadow: none;
    font-family: JetBrainsMono Nerd Font Mono;
    font-size: 14px;
    margin: 0;
    min-height: 0;
    padding: 0;
    text-shadow: none;
    transition: none;
  }

  window#waybar {
    background-color: ${config.stylix.base16Scheme.base00};
  }

  .modules-left,
  .modules-right {
    padding: 0 10px;
  }

  tooltip {
    padding: 0;
    margin: 0;
    background-color: ${config.stylix.base16Scheme.base00};
    color: ${config.stylix.base16Scheme.base05};
    border-width: 0px;
    border-color: ${config.stylix.base16Scheme.base0C};
    border-radius: 6px;
  }

  tooltip label {
    padding: 0;
    margin: 0;
    background-color: inherit;
    color: ${config.stylix.base16Scheme.base05};
  }

  #custom-keyboard,
  #network,
  #wireplumber,
  #battery,
  #clock,
  #workspaces button,
  #tray {
    min-width: 14px;
    min-height: 14px;
    padding: 1px 3px;
    color: ${config.stylix.base16Scheme.base05};
    background-repeat: no-repeat;
    background-position: center;
    background-size: 14px;
  }

  #wireplumber.muted,
  #network.disabled,
  #network.disconnected {
    background-image: none;
    margin: 0;
    min-height: 0;
    min-width: 0;
    opacity: 0;
    padding: 0;
  }

  tooltip {
    border-radius: 4px;
  }

  #custom-keyboard {
    background-image: url("${iconsPath}/keyboard.svg");
  }

  #custom-keyboard.disabled {
    opacity: 0.5;
  }

  #network {
    background-image: url("${iconsPath}/network-default.svg");
  }

  #network.ethernet {
    background-image: url("${iconsPath}/network-ethernet.svg");
  }

  #network.disabled,
  #network.disconnected {
    opacity: 0.3;
  }

  #wireplumber {
    background-image: url("${iconsPath}/wireplumber-default.svg");
  }

  #wireplumber.muted {
    opacity: 0.3;
  }

  #workspaces button {
    opacity: 0.5;
    background-image: none;
  }

  #workspaces button.active {
    opacity: 1;
    background-color: ${config.stylix.base16Scheme.base0D};
    color: ${config.stylix.base16Scheme.base00};
  }

  #custom-keyboard.hidden {
    opacity: 0;
    min-width: 0;
    margin: 0;
    padding: 0;
  }
''
