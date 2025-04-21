''
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

  nix() {
    if [[ "$1" == "develop" ]]; then
      shift
      local flake_path_given=false
      for arg in "$@"; do
        if [[ "$arg" == *#* ]]; then
          flake_path_given=true
          break
        fi
        if [[ "$arg" != -* ]]; then
          flake_path_given=true
          break
        fi
      done
      if ! $flake_path_given; then
        set -- /home/onat/nix "$@"
      fi
      for arg in "$@"; do
        if [[ "$arg" == "-c" ]]; then
          command nix develop "$@"
          return
        fi
      done
      command nix develop "$@" -c zsh
    else
      command nix "$@"
    fi
  }
''
