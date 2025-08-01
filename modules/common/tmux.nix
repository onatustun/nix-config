{
  pkgs,
  inputs,
  ...
}: let
  scripts = let
    inherit (pkgs) writeShellScriptBin;
    inherit (builtins) readFile;
    inherit (inputs) self;
  in {
    sessionizer = writeShellScriptBin "sessionizer" (readFile (self + "/scripts/sessionizer.sh"));
    github = writeShellScriptBin "github" (readFile (self + "/scripts/github.sh"));
  };
in {
  home-manager.sharedModules = [
    {
      programs.tmux = {
        enable = true;
        baseIndex = 1;
        escapeTime = 0;
        keyMode = "vi";
        mouse = true;
        prefix = "C-b";

        extraConfig = let
          inherit (scripts) sessionizer github;
        in ''
          set -g default-terminal "tmux-256color"
          set -ag terminal-overrides ",xterm-256color:RGB"

          set -g status-position top
          set -g status-justify absolute-centre
          set -g status-style "fg=blue bg=default"
          set -g status-right ""
          set -g status-left "#S"
          set -g status-left-style "fg=color8"
          set -g status-right-length 0
          set -g status-left-length 100
          setw -g window-status-current-style "fg=blue bg=default bold"
          setw -g window-status-current-format "#I:#W "
          setw -g window-status-style "fg=color8"

          bind-key h select-pane -L
          bind-key j select-pane -D
          bind-key k select-pane -U
          bind-key l select-pane -R

          bind-key -r H resize-pane -L 5
          bind-key -r J resize-pane -D 5
          bind-key -r K resize-pane -U 5
          bind-key -r L resize-pane -R 5

          bind-key f display-popup -w 80% -h 80% -E ${sessionizer}/bin/sessionizer
          bind-key g run-shell -b ${github}/bin/github

          bind-key c new-window -c "#{pane_current_path}"
          bind-key % split-window -h -c "#{pane_current_path}"
          bind-key '"' split-window -v -c "#{pane_current_path}"
          bind-key b set-option status
        '';
      };
    }
  ];
}
