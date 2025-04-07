''
  * {
    font-family: JetBrainsMono Nerd Font Mono;
    font-size: 16px;
  }

  window#waybar {
    background-color: #1d2021;
    color: #928374;
  }

  #workspaces button {
    color: #928374;
    padding: 0px 5px;
    margin: 0px 3px;
    opacity: 0.5;
  }

  #workspaces button.active {
    color: #ebdbb2;
    opacity: 1.0;
  }

  tooltip {
    border-radius: 12px;
  }

  #workspaces, #pulseaudio, #network,
  #battery, #clock {
    font-weight: bold;
    margin: 4px 0px;
    margin-right: 7px;
    border-radius: 10px 24px 10px 24px;
    padding: 0px 18px;
  }

  #battery.critical,
  #network.disabled,
  #network.disconnected,
  #pulseaudio.muted {
    color: #cc241d;
  }

  #battery.charging,
  #battery.warning {
    color: #d65d0e;
  }
''
