{ 
  config,
  iconsPath,
  ...
}: ''
  * {
    font-family: JetBrainsMono Nerd Font Mono;
    font-size: 16px;
    min-height: 0;
    border-radius: 0;
    padding: 0;
    margin: 0;
  }

  #waybar {
    background-color: transparent;
    color: ${config.stylix.base16Scheme.base05};
  }

  .modules-left,
  .modules-center,
  .modules-right {
    background-color: ${config.stylix.base16Scheme.base00};
    border-radius: 8px;
  }

  button, 
  button:hover {
    box-shadow: none;
    text-shadow: none;
    background: none;
    transition: none;
    border: none;
  }

  tooltip {
    border-radius: 12px;
  }

  #workspaces button {
    color: ${config.stylix.base16Scheme.base05};
    opacity: 0.5;
    padding: 0 2px;
    margin: 0 6px;
  }

  #workspaces button.active {
    opacity: 1;
  }

  #clock {
    margin: 0 6px;
    min-width: 16px;
    min-height: 16px;
    padding: 0 2px;
    color: ${config.stylix.base16Scheme.base05};
  }

  #bluetooth, 
  #wireplumber,
  #network,
  #battery {
    margin: 0 6px;
    min-width: 16px;
    min-height: 16px;
    padding: 0 2px;
    background-size: 16px 16px;
    background-position: center;
    background-repeat: no-repeat;
    color: transparent;
  }

  #wireplumber {
    background-image: url("${iconsPath}/wireplumber/default.svg");
  }

  #wireplumber.muted {
    background-image: url("${iconsPath}/wireplumber/muted.svg");
    opacity: 0.5;
  }

  #bluetooth.connected {
    background-image: url("${iconsPath}/bluetooth/connected.svg");
  }

  #bluetooth.off, #bluetooth.disabled {
    background-image: url("${iconsPath}/bluetooth/off.svg");
    opacity: 0.5;
  }

  #network {
    background-image: url("${iconsPath}/network/default.svg");
  }

  #network.disabled, #network.disconnected {
    background-image: url("${iconsPath}/network/disconnect.svg");
    opacity: 0.5;
  }
  
  #battery.empty {
    background-image: url("${iconsPath}/battery/empty.svg");
    opacity: 0.5;
  }

  #battery.low {
    background-image: url("${iconsPath}/battery/low.svg");
  }

  #battery {
    background-image: url("${iconsPath}/battery/default.svg");
  }

  #battery.high {
    background-image: url("${iconsPath}/battery/high.svg");
  }

  #battery.full {
    background-image: url("${iconsPath}/battery/full.svg");
  }

  #battery.charging {
    background-image: url("${iconsPath}/battery/charging.svg");
  }
''
