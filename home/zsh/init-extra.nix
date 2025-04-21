''
  eval "$(direnv hook zsh)"

  zstyle ':completion:*' matcher-list 'm:{a-z={A-Za-z}'
  zstyle ':completion:*' menu no
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -l -a --color=always $realpath'
  zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -l -a --color=always $realpath'

  bindkey -v

  eval "$(fzf --zsh)"
  eval "$(zoxide init --cmd cd zsh)"

  if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
    tmux attach-session -t default || tmux new-session -s default
  fi
''
