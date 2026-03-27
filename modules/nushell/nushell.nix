{
  flake = {
    nixosModules.nushell = {
      username,
      pkgs,
      inputs,
      ...
    }: {
      users.users.${username}.shell = pkgs.nushell;
      home-manager.sharedModules = [inputs.self.homeModules.nushell];
    };

    homeModules.nushell = {
      lib,
      pkgs,
      ...
    }: let
      nushellExe = lib.meta.getExe' pkgs.nushell "nu";
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
            ff = "fastfetch";
            lt = "eza -T --git-ignore --group-directories-first";
          };

          extraConfig = lib.strings.readFile ./extraConfig.nu;
        };
      };
    };
  };
}
