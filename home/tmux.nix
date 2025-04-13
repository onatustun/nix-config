{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    sensibleOnTop = false;
    keyMode = "vi";

    extraConfig = ''
      set -g prefix C-s

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set -g status on
      set -g status-position top
      set -g status-style fg=brightwhite
      setw -g window-status-current-style fg=yellow,bg=default
      set -g status-left-style default
      set -g status-left "#[fg=black]#[bg=yellow] #S #[fg=default]#[bg=default] "
      set -g status-right ""
    '';
  };
}

