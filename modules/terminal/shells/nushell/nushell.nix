{
  flake.modules = {
    nixos = {
      nushell = {
        self,
        type,
        ...
      }: {
        imports = [self.modules.${type}.nushell'];
        home-manager.sharedModules = [self.modules.homeManager.nushell];
      };

      nushell' = {
        username,
        pkgs,
        ...
      }: {
        users.users.${username}.shell = pkgs.nushell;
      };
    };

    homeManager.nushell = {
      lib,
      pkgs,
      self,
      ...
    }: let
      nushellExe = lib.meta.getExe' pkgs.nushell "nu";

      rebuild =
        pkgs.writers.writeNuBin "rebuild"
        (lib.strings.readFile (self + "/scripts/rebuild.nu"));
    in {
      home = {
        packages = [pkgs.nushell];
        sessionVariables.SHELL = nushellExe;
        shell.enableShellIntegration = true;
      };

      programs = {
        ghostty.settings.command = "${nushellExe} --login";

        helix.settings.editor.shell = [
          "nu"
          "--commands"
        ];

        nushell = {
          enable = true;

          environmentVariables = {
            SHELL = nushellExe;
            NIXPKGS_ALLOW_UNFREE = "1";
            PROMPT_COMMAND = "";
            PROMPT_COMMAND_RIGHT = "";
            PROMPT_INDICATOR_VI_INSERT = "";
            PROMPT_INDICATOR_VI_NORMAL = "";
            TRANSIENT_PROMPT_COMMAND = "";
            TRANSIENT_PROMPT_COMMAND_RIGHT = "";
            TRANSIENT_PROMPT_INDICATOR = "";
            TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = "";
            TRANSIENT_PROMPT_INDICATOR_VI_INSERT = "";
            TRANSIENT_PROMPT_MULTILINE_INDICATOR = "";
          };

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
            ns = "nix-search";
            rmf = "rm -frv";
            rm = "rm -rv";
            sl = "ls";
            s = "sudo -E";
            "sx." = "sudo -E hx .";
            sx = "sudo -E hx";
            tree = "eza -T --git-ignore --group-directories-first";
            "x." = "hx .";
            x = "hx";
            z = "cd";
            zi = "cdi";
            rebuild = "${lib.meta.getExe rebuild}";
          };

          extraConfig = lib.strings.readFile ./extraConfig.nu;
        };
      };
    };
  };
}
