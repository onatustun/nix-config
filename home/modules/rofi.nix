{
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    cycle = false;

    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun,filebrowser";
      font = "JetBrainsMono Nerd Font Mono";
      show-icons = true;
      disable-history = true;
      hover-select = true;
      bw = 0;
      display-drun = "";
      display-window = "";
      display-combi = "";
      terminal = "ghostty";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      kb-cancel = "Escape,MouseMiddle";
    };

    theme = lib.mkForce {
      "*" = {
        font = "JetBrainsMono Nerd Font Mono";
      };

      window = {
        fullscreen = true;
      };

      prompt = {
        enabled = false;
      };

      icon-search = {
        expand = false;
        filename = "search";
      };

      entry = {
        placeholder = "Search";
      };

      listview = {
        columns = 6;
        fixed-columns = true;
      };
    };
  };
}
