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
  #wireplumber,
  #network,
  #battery {
    margin: 0 6px 0 6px;
    padding: 0;
    font-weight: 500;
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

  #bluetooth {
    min-width: 25px;
    min-height: 18px;
    background-size: 18px;
    background-image: ./bluetooth.svg;
    background-position: center;
    background-repeat: no-repeat;
    margin: 0 4px;
  }
''
