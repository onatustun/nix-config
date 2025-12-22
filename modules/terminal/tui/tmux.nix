{
  flake.modules.homeManager.tmux = {
    pkgs,
    lib,
    self,
    ...
  }: let
    github =
      pkgs.writers.writeNuBin "github"
      (lib.strings.readFile (self + "/scripts/github.nu"));

    sessionizer =
      pkgs.writers.writeNuBin "sessionizer"
      (lib.strings.readFile (self + "/scripts/sessionizer.nu"));
  in {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 0;
      keyMode = "vi";
      mouse = true;
      prefix = "C-b";

      extraConfig = ''
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

        bind-key e display-popup -w 80% -h 80% ${lib.meta.getExe pkgs.scooter}
        bind-key f display-popup -w 80% -h 80% -E ${lib.meta.getExe sessionizer}
        bind-key g neww -n "git" -S ${lib.meta.getExe pkgs.lazygit}
        bind-key j neww -n "jj" -S ${lib.meta.getExe pkgs.jjui}
        bind-key G run-shell -b ${lib.meta.getExe github}
        bind-key t display-popup -w 80% -h 80% -d '#{pane_current_path}' ${lib.meta.getExe' pkgs.nushell "nu"} --login

        bind-key c new-window -c "#{pane_current_path}"
        bind-key % split-window -h -c "#{pane_current_path}"
        bind-key '"' split-window -v -c "#{pane_current_path}"
        bind-key b set-option status
      '';
    };
  };
}
