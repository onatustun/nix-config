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
    border-radius: 6px;
  }

  #leftWrapper {
    background-color: #1d2021;
    color: #928374;
    border-radius: 6px;
  }

  #rightWrapper {
    background-color: #1d2021;
    color: #928374;
    padding: 0 4px 0 4px;
    border-radius: 6px;
  }

  #window {
    padding: 0;
    color: #928374;
  }

  #window.empty, #window.solo {
    padding: 0;
    background-color: transparent;
  }

  button {
    box-shadow: none;
    text-shadow: none;
    background: none;
    transition: none;
    border: none;
  }

  button:hover {
    box-shadow: none;
    text-shadow: none;
    background: none;
    transition: none;
    border: none;
  }

  .modules-left {
    background-color: inherit;
    border-radius: 0;
  }

  .modules-right {
    background-color: inherit;
    border-radius: 0;
  }

  .modules-left > widget:first-child > #workspaces {
    margin-left: 0;
    padding-left: 0;
  }

  .modules-right > widget:last-child > #workspaces {
    margin-right: 0;
    padding-right: 0;
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

  #tray {
    padding: 0 4px 0 4px;
    border-radius: 6px;
  }

  #tray > .passive {
      -gtk-icon-effect: dim;
  }

  #tray > .needs-attention {
      -gtk-icon-effect: highlight;
  }
''
