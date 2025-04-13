''
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
    color: #928374;
  }

  .modules-left,
  .modules-center,
  .modules-right {
    background-color: #1d2021;
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
    color: #928374;
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
    color: #928374;
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
    background-image: url("${./icons/wireplumber/default.svg}");
  }

  #wireplumber.muted {
    background-image: url("${./icons/wireplumber/muted.svg}");
    opacity: 0.5;
  }

  #bluetooth.connected {
    background-image: url("${./icons/bluetooth/connected.svg}");
  }

  #bluetooth.off, #bluetooth.disabled {
    background-image: url("${./icons/bluetooth/off.svg}");
    opacity: 0.5;
  }

  #network {
    background-image: url("${./icons/network/default.svg}");
  }

  #network.disabled, #network.disconnected {
    background-image: url("${./icons/network/disconnect.svg}");
    opacity: 0.5;
  }
  
  #battery.empty {
    background-image: url("${./icons/battery/empty.svg}");
    opacity: 0.5;
  }

  #battery.low {
    background-image: url("${./icons/battery/low.svg}");
  }

  #battery {
    background-image: url("${./icons/battery/default.svg}");
  }

  #battery.high {
    background-image: url("${./icons/battery/high.svg}");
  }

  #battery.full {
    background-image: url("${./icons/battery/full.svg}");
  }

  #battery.charging {
    background-image: url("${./icons/battery/charging.svg}");
  }
''
