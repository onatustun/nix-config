{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    prefix = "C-s";

    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind-key -r H resize-pane -L 5
      bind-key -r J resize-pane -D 5
      bind-key -r K resize-pane -U 5
      bind-key -r L resize-pane -R 5

      bind-key c new-window -c "#{pane_current_path}"
      bind-key % split-window -h -c "#{pane_current_path}"
      bind-key '"' split-window -v -c "#{pane_current_path}"

      set -g status on
      set -g status-position top
      set -g status-style fg=brightwhite
      set -g status-left "#[fg=black]#[bg=yellow] #S #[fg=default]#[bg=default]"
      set -g status-left-style default
      set -g status-right ""
      setw -g window-status-current-style fg=yellow,bg=default
    '';
  };
}
