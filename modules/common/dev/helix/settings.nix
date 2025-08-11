{
  lib,
  inputs,
  pkgs,
  config,
  isDarwin,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      home.sessionVariables = {
        EDITOR = "hx";
        VISUAL = "hx";
      };

      programs.helix = enabled {
        package =
          if isDarwin
          then pkgs.helix
          else inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default;

        defaultEditor = true;

        settings = {
          theme = "${config.stylix.base16Scheme.name}";

          editor = {
            true-color = true;
            default-yank-register = "+";
            middle-click-paste = false;

            shell = [
              "bash"
              "-c"
            ];

            line-number = "relative";
            cursorline = true;
            continue-comments = false;
            auto-format = false;
            idle-timeout = 0;
            completion-replace = true;
            bufferline = "multiple";
            color-modes = true;
            insert-final-newline = false;
            end-of-line-diagnostics = "warning";
            clipboard-provider =
              if isDarwin
              then "pasteboard"
              else "wayland";
            lsp.display-inlay-hints = true;
            cursor-shape.insert = "bar";
            file-picker.hidden = false;
            auto-pairs = true;
            auto-save = false;
            inline-diagnostics.cursor-line = "warning";

            statusline = {
              left = [
                "mode"
                "spinner"
                "file-name"
                "read-only-indicator"
                "file-modification-indicator"
              ];

              right = [
                "version-control"
                "diagnostics"
                "selections"
                "position"
                "total-line-numbers"
              ];

              mode = {
                normal = "N";
                insert = "I";
                select = "S";
              };
            };

            whitespace = {
              render.tab = "all";
              characters.tab = "→";
            };

            indent-guides = {
              render = true;
              character = "▏";
              skip-levels = 1;
            };

            gutters = {
              layout = [
                "diagnostics"
                "spacer"
                "line-numbers"
                "spacer"
                "diff"
              ];

              line-numbers.min-width = 1;
            };
          };

          keys = {
            normal = {
              x = "select_line_below";
              X = "select_line_above";

              G = {
                j = "@vgj<esc>";
                k = "@vgk<esc>";
              };

              g = {
                j = "goto_last_line";
                k = "goto_file_start";
              };
            };

            select = {
              x = "select_line_below";
              X = "select_line_above";

              g = {
                j = "goto_last_line";
                k = "goto_file_start";
              };
            };
          };
        };
      };

      home.file.".ignore".text = ''
        .direnv
        .github
        node_modules
        .pre-commit-config.yaml
        result
      '';
    }
  ];
}
