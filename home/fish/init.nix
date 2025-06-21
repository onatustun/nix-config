{
  programs.fish = {
    shellInit = ''
      fish_vi_key_bindings

      set fish_cursor_default block
      set fish_cursor_insert block
      set fish_cursor_replace_one block
      set fish_cursor_replace block
      set fish_cursor_external block
      set fish_cursor_visual block

      zoxide init --cmd cd fish | source
    '';

    loginShellInit = ''
      set -gx NIXPKGS_ALLOW_UNFREE 1
      set fish_greeting
    '';

    interactiveShellInit = ''
      if status is-interactive
      and not set -q TMUX
        if tmux has-session -t onat
          exec tmux attach-session -t onat
        else
          tmux new-session -s onat
        end
      end

      direnv hook fish | source
    '';

    shellInitLast = ''
      set fzf_preview_dir_cmd eza -l -a --color=always
    '';
  };
}
