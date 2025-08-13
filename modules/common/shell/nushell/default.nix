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

  environment = {
    shells = [pkgs.nushell];

    systemPackages = with pkgs; [
      nufmt
      nushell
    ];
  };

  home-manager.sharedModules = [
    {
      home.sessionVariables.SHELL = "${pkgs.nushell}/bin/nu";

      programs.nushell = enabled {
        plugins = with pkgs.nushellPlugins; [
          gstat
          polars
          query
        ];

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

        environmentVariables = {
          PROMPT_INDICATOR_VI_INSERT = "";
          PROMPT_INDICATOR_VI_NORMAL = "";
          PROMPT_COMMAND = "";
          PROMPT_COMMAND_RIGHT = "";
          NIXPKGS_ALLOW_UNFREE = "1";
          NIXPKGS_ALLOW_INSECURE = "1";
          SHELL = "${pkgs.nushell}/bin/nu";
          EDITOR = "hx";
          VISUAL = "hx";
          CARAPACE_BRIDGES = "inshellisense,carapace,zsh,fish,bash";
        };

        extraEnv = "$env.CARAPACE_BRIDGES = 'inshellisense,carapace,zsh,fish,bash'";

        extraConfig =
          readFile ./extraConfig.nu
          + "\n"
          + "\n"
          + ''
            source "${homeDir}/.config/nushell/carapace.nu"
          '';
      };
    }
  ];
}
