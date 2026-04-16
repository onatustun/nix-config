{
  flake.modules = {
    nixos.nushell =
      {
        username,
        pkgs,
        inputs,
        ...
      }:
      {
        users.users.${username}.shell = pkgs.nushell;
        home-manager.sharedModules = [ inputs.self.modules.homeManager.nushell ];
      };

    homeManager.nushell =
      {
        lib,
        pkgs,
        config,
        ...
      }:
      let
        inherit (lib.meta) getExe;
        inherit (lib.strings) readFile;
      in
      {
        home = {
          packages = [ pkgs.nushell ];
          sessionVariables.SHELL = getExe pkgs.nushell;
          shell.enableShellIntegration = true;
        };

        programs = {
          ghostty.settings.command = "${config.home.sessionVariables.SHELL} --login";

          helix.settings.editor.shell = [
            "nu"
            "--commands"
          ];

          nushell = {
            enable = true;

            environmentVariables = {
              inherit (config.home.sessionVariables) SHELL;
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

            extraConfig = readFile ./extraConfig.nu;
          };
        };
      };
  };
}
