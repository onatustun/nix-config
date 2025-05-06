{
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      c = "clear";
      ff = "fastfetch";
      ls = "eza -l -a";
      rebuild = "sudo nixos-rebuild switch --flake ~/nix#laptop";
      tree = "eza -T";
      yz = "yazi";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "plugin-sudope";
        src = pkgs.fishPlugins.plugin-sudope.src;
      }
    ];

    shellInit = ''
      set fish_greeting
      fish_vi_key_bindings
      zoxide init --cmd cd fish | source

      if status is-interactive
      and not set -q TMUX
        if tmux has-session -t 0
          exec tmux attach-session -t 0
        else
          tmux new-session -s 0
        end
      end

      set fzf_preview_dir_cmd eza -l -a --color=always
      direnv hook fish | source
    '';
  };
}
