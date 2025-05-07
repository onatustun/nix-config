''
  if status is-interactive
  and not set -q TMUX
    if tmux has-session -t 0
      exec tmux attach-session -t 0
    else
      tmux new-session -s 0
    end
  end

  direnv hook fish | source
''
