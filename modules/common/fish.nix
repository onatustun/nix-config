{
  lib,
  pkgs,
  username,
  isWsl,
  homeDir,
  ...
}: let
  inherit (lib) optionalString;
in {
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.sessionVariables.SHELL = "fish";

  home-manager.sharedModules = [
    {
      programs = {
        command-not-found.enable = true;

        carapace = {
          enable = true;
          enableFishIntegration = true;
        };

        zoxide = {
          enable = true;
          enableFishIntegration = true;
          options = ["--cmd cd"];
        };

        fish = {
          enable = true;

          shellInit = ''
            set -g fish_term24bit 1
            fish_vi_key_bindings

            for mode in default insert replace_one replace external visual
              set fish_cursor_$mode block
            end

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
              ${optionalString isWsl "cd ~"}

              if tmux has-session -t ${username}
                exec tmux attach-session -t ${username}
              else
                tmux new-session -s ${username}
              end
            end

            direnv hook fish | source

            ${optionalString isWsl "fish_add_path --append /mnt/c/Users/onatu/scoop/apps/win32yank/0.1.1"}
          '';

          shellInitLast = "set fzf_preview_dir_cmd eza -l -a --color=always";

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
