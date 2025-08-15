{
  lib,
  username,
  pkgs,
  isWsl,
  ...
}: let
  inherit (lib) enabled optionalString;
  inherit (builtins) readFile;
in {
  users.users.${username}.shell = pkgs.nushell;
  environment.shells = [pkgs.nushell];

  home-manager.sharedModules = [
    {
      home.sessionVariables.SHELL = "${pkgs.nushell}/bin/nu";

      programs.nushell = enabled {
        shellAliases = {
          c = "clear";
          cp = "cp -prv";
          ff = "fastfetch";
          la = "ls -a";
          lla = "ls -la";
          ll = "ls -l";
          l = "ls";
          lt = "eza -T --git-ignore --group-directories-first";
          man = "batman";
          md = "mkdir -v";
          melt = "nix-melt";
          mv = "mv -v";
          nsf = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
          ns = "nix-search";
          rmf = "rm -frv";
          rm = "rm -rv";
          sl = "ls";
          s = "sudo -E";
          "sx." = "sudo -E hx .";
          sx = "sudo -E hx";
          syz = "sudo -E yazi";
          tree = "eza -T --git-ignore --group-directories-first";
          "x." = "hx .";
          x = "hx";
          yz = "yazi";
          z = "cd";
          zi = "cdi";
        };

        extraEnv = ''
          ${readFile ./extraEnv.nu}
        '';

        extraConfig = ''
          ${readFile ./extraConfig.nu}

          if (
            $nu.is-interactive
            and (which tmux | length) > 0
            and (($env.TMUX? | default "" | str length) == 0)
          ) {
            ${optionalString isWsl "cd ~"}

            let session = "${username}"

            tmux new-session -A -s $session

            if $env.LAST_EXIT_CODE == 0 {
              exit
            }
          }

          ${optionalString isWsl ''
            let-env PATH = (
              $env.PATH
              | split row (char PATH_SEP)
              | append "/mnt/c/Users/onatu/scoop/apps/win32yank/0.1.1"
              | uniq
              | str join (char PATH_SEP)
            )
          ''}
        '';
      };
    }
  ];
}
