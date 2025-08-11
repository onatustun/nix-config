{
  lib,
  pkgs,
  username,
  isWsl,
  ...
}: let
  inherit (lib) enabled optionalString;
in {
  programs.fish = enabled;
  users.users.${username}.shell = pkgs.fish;

  environment = {
    shells = [pkgs.fish];

    systemPackages = with pkgs; [
      carapace
      inshellisense
      zsh
    ];
  };

  home-manager.sharedModules = [
    {
      home.sessionVariables.SHELL = "fish";

      programs = {
        carapace = enabled {enableFishIntegration = true;};

        zoxide = enabled {
          enableFishIntegration = true;
          options = ["--cmd cd"];
        };

        fish = enabled {
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
            melt = "nix-melt";
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
            ls = "eza -al";
            man = "batman";
            nsf = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
            ping = "prettyping";
            sl = "eza -al";
            tree = "eza -T";
          };
        };
      };
    }
  ];
}
