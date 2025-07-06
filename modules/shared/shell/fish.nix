{
  pkgs,
  username,
  homeDir,
  ...
}: {
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  environment = {
    sessionVariables.SHELL = "fish";
    systemPackages = [pkgs.xclip];
  };

  home-manager.sharedModules = [
    {
      programs = {
        command-not-found.enable = true;

        fish = {
          enable = true;

          shellInit = ''
            fish_vi_key_bindings

            set fish_cursor_default block
            set fish_cursor_insert block
            set fish_cursor_replace_one block
            set fish_cursor_replace block
            set fish_cursor_external block
            set fish_cursor_visual block

            zoxide init --cmd cd fish | source

            bind -M command ctrl-z 'toggle-editor'
            bind -M default ctrl-z 'toggle-editor'
            bind -M insert ctrl-z 'toggle-editor'
            bind -M visual ctrl-z 'toggle-editor'
          '';

          loginShellInit = ''
            set -gx NIXPKGS_ALLOW_UNFREE 1
            set fish_greeting
          '';

          interactiveShellInit = ''
            if status is-interactive
            and not set -q TMUX
              if tmux has-session -t ${username}
                exec tmux attach-session -t ${username}
              else
                tmux new-session -s ${username}
              end
            end

            direnv hook fish | source
          '';

          shellInitLast = ''
            set fzf_preview_dir_cmd eza -l -a --color=always
          '';

          shellAbbrs = {
            c = "clear";
            cp = "cp -prv";
            ff = "fastfetch";
            find = "fd";
            lg = "lazygit";
            md = "mkdir -pv";
            mv = "mv -v";
            ns = "nix-search";
            rmf = "rm -frv";
            rm = "rm -rv";
            s = "sudo -E";
            "sx." = "sudo -E hx .";
            sx = "sudo -E hx";
            syz = "sudo -E yazi";
            "x." = "hx .";
            x = "hx";
            yz = "yazi";
          };

          shellAliases = {
            cat = "prettybat";
            cff = "clear && fastfetch";
            cl = "clear && eza -al";
            clt = "clear && eza -T";
            ls = "eza -al";
            man = "batman";
            nsf = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
            ping = "prettyping";
            sl = "eza -al";
            tree = "eza -T";
          };

          functions = {
            cpp = "cp -prv $argv ..";
            flakeinit = "nix flake init -t '${homeDir}/nix#'\$argv";
            mvp = "mv -v $argv ..";
            rebuild = "nh os switch -H $argv";
            shot = "grim -g \"$(slurp)\" ${homeDir}/Pictures/$argv.png";

            toggle-editor = ''
              if jobs -q
                sleep 0.1
                fg 2>/dev/null
              else
                hx .
              end
            '';
          };

          plugins = with pkgs.fishPlugins; [
            {
              name = "autopair";
              src = autopair.src;
            }
            {
              name = "done";
              src = done.src;
            }
            {
              name = "fish-you-should-use";
              src = fish-you-should-use.src;
            }
            {
              name = "fzf-fish";
              src = fzf-fish.src;
            }
            {
              name = "plugin-git";
              src = plugin-git.src;
            }
            {
              name = "plugin-sudope";
              src = plugin-sudope.src;
            }
            {
              name = "puffer";
              src = puffer.src;
            }
            {
              name = "sponge";
              src = sponge.src;
            }
          ];
        };
      };
    }
  ];
}
