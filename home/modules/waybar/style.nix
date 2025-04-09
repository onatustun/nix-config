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

  .modules-left, .modules-right {
    background-color: #1d2021;
    padding: 0 4px;
    border-radius: 8px;
  }

  button, button:hover {
    box-shadow: none;
    text-shadow: none;
    background: none;
    transition: none;
    border: none;
  }

  tooltip {
    border-radius: 12px;
  }

  #clock,
  #battery {
    margin: 0 6px;
  }

  #workspaces button {
    color: #928374;
    opacity: 0.8;
    padding: 0 4px;
  }

  #workspaces button.active {
    opacity: 1;
  }

  #battery.critical {
    color: #cc241d;
  }

  #battery.charging,
  #battery.warning {
    color: #d65d0e;
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
  }

  #bluetooth.connected {
    background-image: url("${./icons/bluetooth/connected.svg}");
  }

  #bluetooth.off, #bluetooth.disabled {
    background-image: url("${./icons/bluetooth/off.svg}");
  }

  #network.disabled, #network.disconnected {
    background-image: url("${./icons/network/disconnect.svg}");
  }

  #network {
    background-image: url("${./icons/network/default.svg}");
  }
  
  #battery {
    background-image: url("${./icons/battery/default.svg}");
  }

  #battery.low {
    background-image: url("${./icons/battery/low.svg}");
  }
  
  #battery.empty {
    background-image: url("${./icons/battery/empty.svg}");
  }

  #battery.high {
    background-image: url("${./icons/battery/high.svg}");
  }

  #battery.full {
    background-image: url("${./icons/battery/full.svg}");
  }

 ''
