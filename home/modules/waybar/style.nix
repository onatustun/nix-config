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
  #network,
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

  #battery.critical,
  #network.disabled,
  #network.disconnected,
  #wireplumber.muted {
    color: #cc241d;
  }

  #battery.charging,
  #battery.warning {
    color: #d65d0e;
  }

  #bluetooth, #wireplumber {
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

  #bluetooth.off, #format-disabled {
    background-image: url("${./icons/bluetooth/off.svg}");
  }
''
