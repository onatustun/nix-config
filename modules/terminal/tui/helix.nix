{lib, ...}: {
  flake.modules.homeManager.helix = {
    inputs',
    config,
    pkgs,
    ...
  }: let
    package = inputs'.helix.packages.default;
  in {
    home = {
      packages = [package];

      sessionVariables = {
        EDITOR = lib.meta.getExe' package "hx";
        VISUAL = config.home.sessionVariables.EDITOR;
      };
    };

    programs = {
      nushell.environmentVariables = {inherit (config.home.sessionVariables) EDITOR VISUAL;};

      helix = {
        enable = true;
        inherit package;

        settings = {
          editor = {
            true-color = true;
            default-yank-register = "+";
            middle-click-paste = false;
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
            lsp.display-inlay-hints = true;
            cursor-shape.insert = "bar";
            file-picker.hidden = false;
            auto-pairs = true;
            auto-save = false;
            inline-diagnostics.cursor-line = "warning";
            jump-label-alphabet = "jkl;hfdsagbceimnopqrtuvwxyz";

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

              space.B = ":sh git show -s --date=format-local:%%d/%%m/%%y --format=\"%%h (%%cn %%cd) %%s\" (git blame -L %{cursor_line},%{cursor_line} --porcelain %{buffer_name} | lines | first | split words | first)";
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

        languages = {
          language = [
            {
              name = "tsx";
              auto-format = true;

              formatter = {
                command = "prettier";

                args = [
                  "--parser"
                  "typescript"
                ];
              };

              language-servers = [
                "tailwindcss-ls"
                "typescript-language-server"
                "uwu-colors"
              ];
            }
            {
              name = "jsx";
              auto-format = true;

              formatter = {
                command = "prettier";

                args = [
                  "--parser"
                  "typescript"
                ];
              };

              language-servers = [
                "tailwindcss-ls"
                "typescript-language-server"
                "uwu-colors"
              ];
            }
            {
              name = "html";
              formatter = {
                command = "prettier";

                args = [
                  "--parser"
                  "html"
                ];
              };

              language-servers = [
                "tailwindcss-ls"
                "vscode-html-language-server"
                "vscode-css-language-server"
                "typescript-language-server"
                "uwu-colors"
              ];
            }
            {
              name = "css";
              formatter = {
                command = "prettier";

                args = [
                  "--parser"
                  "css"
                ];
              };

              language-servers = [
                "tailwindcss-ls"
                "vscode-css-language-server"
                "uwu-colors"
              ];
            }
            {
              name = "nix";
              auto-format = true;
              formatter.command = "alejandra";

              language-servers = [
                "nixd"
                "uwu-colors"
              ];
            }
            {
              name = "nu";

              indent = {
                tab-width = 2;
                unit = "  ";
              };
            }
          ];

          language-server = {
            uwu-colors.command = "${lib.meta.getExe' pkgs.uwu-colors "uwu_colors"}";
            nixd.command = "${lib.meta.getExe inputs'.nixd.packages.default}";
          };
        };

        ignores = [
          ".direnv"
          "node_modules"
          ".pre-commit-config.yaml"
          "result"
        ];
      };
    };
  };
}
