{
  lib,
  username,
  pkgs,
  homeDir,
  ...
}: let
  inherit (lib) enabled;
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

          source "${homeDir}/.config/nushell/carapace.nu"
        '';
      };
    }
  ];
}
