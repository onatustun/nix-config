{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix#laptop";
      ls = "ls -la --color";
      ff = "fastfetch";
      c = "clear";
      cat = "bat";
    };

    history.ignoreAllDups = true;

    initExtra = ''
      zstyle ':completion:*' matcher-list 'm:{a-z={A-Za-z}'
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -a -l --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -a -l --color $realpath'

      bindkey -v

      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"

      if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
        tmux attach-session -t default || tmux new-session -s default
      fi


    '';

    oh-my-zsh = {
      enable = true;

      plugins = [
	      "command-not-found"
        "git"
	      "sudo"
	      "fzf"
	      "npm"
	      "systemd"
	      "tmux"
      ];
    };
  };
}
