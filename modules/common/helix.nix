{
  config,
  inputs,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  home-manager.sharedModules = [
    {
      programs.helix = {
        enable = true;
        package = inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default;
        defaultEditor = true;

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
              ];
            }

            {
              name = "html";
              auto-format = true;

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
              ];
            }

            {
              name = "css";
              auto-format = true;

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
              ];
            }

            {
              name = "typst";
              auto-format = true;
              formatter.command = "typstyle";

              language-servers = [
                "tinymist"
              ];
            }

            {
              name = "nix";
              auto-format = true;
              formatter.command = "alejandra";

              language-servers = [
                "nixd"
              ];
            }
          ];

          language-server = {
            nixd = {
              command = "${inputs.nixd.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/nixd";
            };
          };
        };

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
            clipboard-provider = "wayland";
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
              G = {
                j = "@vgj<esc>";
                k = "@vgk<esc>";
              };

              g = {
                j = "goto_last_line";
                k = "goto_file_start";
              };

              C-g = [
                ":write-all"
                ":new"
                ":insert-output lazygit"
                ":buffer-close!"
                ":redraw"
                ":reload-all"
              ];
            };

            select.g = {
              j = "goto_last_line";
              k = "goto_file_start";
            };
          };
        };
      };

      home.file = {
        ".ignore".text = ''
          .direnv
          node_modules
          .github
        '';

        ".config/helix/themes/solarized.toml".text = ''
          "attribute" = { fg = "blue300" }
          "comment" = { fg = "base01" }
          "constant.builtin" = { fg = "red500", modifiers = ["bold"] }
          "constant.character.escape" = { fg = "orange900", modifiers = ["bold"] }
          "constant.character" = { fg = "cyan500" }
          "constant" = { fg = "red500" }
          "constructor" = { fg = "orange500" }
          "diagnostic.error" = { fg = "red500", bg = "red900",underline = { style = "curl", color = "red900" } }
          "diagnostic.hint" = { fg = "cyan500", bg = "cyan900", underline = { style = "curl", color = "cyan900" } }
          "diagnostic.info" = { fg = "blue500", bg = "blue900", underline = { style = "curl", color = "blue900" } }
          "diagnostic.warning" = { fg = "yellow500", bg = "yellow900", underline = { style = "curl", color = "yellow900" } }
          "diff.delta" = { fg = "orange900" }
          "diff.minus" = { fg = "red900" }
          "diff.plus" = { fg = "green900" }
          "error" = { fg = "red500", modifiers= ["bold", "underlined"] }
          "function.builtin" = { fg = "blue900", modifiers = ["bold"] }
          "function" = { fg = "blue500" }
          "function.macro" = { fg = "magenta900" }
          "function.special" = { fg = "magenta900" }
          "hint" = { fg = "cyan500", modifiers= ["bold", "underlined"] }
          "info" = { fg = "blue500", modifiers= ["bold", "underlined"] }
          "keyword.control.import" = { fg = "green500" }
          "keyword.directive" = { fg = "red500" }
          "keyword" = { fg = "green500" }
          "keyword.function" = { fg = "green500" }
          "keyword.storage.modifier" = { fg = "green500" }
          "keyword.storage.type" = { fg = "green500" }
          "label" = { fg = "green500" }
          "markup.bold" = { fg = "yellow500", modifiers = ["bold"] }
          "markup.heading" = "green300"
          "markup.italic" = { fg = "magentac300", modifiers = ["italic"] }
          "markup.link.text" = "blue300"
          "markup.link.url" = { fg = "yellow300", modifiers = ["underlined"] }
          "markup.list" = "red300"
          "markup.quote" = "cyan300"
          "markup.raw" = "green300"
          "markup.strikethrough" = { modifiers = ["crossed_out"] }
          "module" = { fg = "violet900" }
          "namespace" = { fg = "violet300" }
          "operator" = { fg = "green500" }
          "punctuation.bracket" = { fg = "orange500" }
          "punctuation.delimiter" = { fg = "green500" }
          "punctuation" = { fg = "orange500" }
          "punctuation.special" = { fg = "orange500" }
          "special" = { fg = "orange500" }
          "string" = { fg = "cyan500" }
          "tag" = { fg = "green500" }
          "type.builtin" = { fg = "yellow300", modifiers = ["bold"] }
          "type" = { fg = "yellow300" }
          "ui.background" = {}
          "ui.cursor" = {fg = "base02", bg = "cyan900"}
          "ui.cursor.insert" = {fg = "base04", bg = "base3"}
          "ui.cursorline" = { bg = "base04" }
          "ui.cursorline.primary" = { bg = "base02" }
          "ui.cursorline.secondary" = { bg = "base03" }
          "ui.cursor.match" = { fg = "base04", bg = "base00" }
          "ui.cursor.primary" = { fg = "base04", bg = "base1" }
          "ui.cursor.select" = { fg = "base02", bg = "cyan900" }
          "ui.gutter.selected" = { bg = "base02" }
          "ui.help" = { modifiers = ["reversed"] }
          "ui.highlight" = { fg = "yellow100" }
          "ui.linenr" = { fg = "base01" }
          "ui.linenr.selected" = { fg = "yellow500", modifiers = ["bold"] }
          "ui.menu" = { fg = "base0", bg = "base03" }
          "ui.menu.selected" = { fg = "base02", bg = "base2"}
          "ui.popup" = { fg = "base1", bg = "base02" }
          "ui.popup.info" = {fg = "base02", bg = "base04", modifiers = ["bold"]}
          "ui.selection" = { bg = "base02" }
          "ui.selection.primary" = { bg = "base01" }
          "ui.statusline" = { fg = "base1", bg = "base03" }
          "ui.statusline.inactive" = { fg = "base0", bg = "base04" }
          "ui.statusline.insert" = { fg = "base04", bg = "green500", modifiers = ["bold"]}
          "ui.statusline.normal" = { fg = "base03", bg = "blue500", modifiers = ["bold"]}
          "ui.statusline.select" = { fg = "base04", bg = "yellow500", modifiers = ["bold"]}
          "ui.statusline.seperator" = { bg = "yellow500" }
          "ui.text" = { fg = "base1" }
          "ui.text.focus" = { fg = "blue300", modifiers = ["bold"]}
          "ui.text.inactive" = { fg = "base01" }
          "ui.text.info" = { fg = "base2" }
          "ui.virtual.indent-guide" = { fg = "base02" }
          "ui.virtual.inlay-hint" = { fg = "base01", modifiers = ["italic"] }
          "ui.virtual.ruler" = { fg = "red900" }
          "ui.virtual.whitespace" = { fg = "base01" }
          "ui.window" = { fg = "base3" }
          "variable.builtin" = { fg = "orange500" }
          "variable" = { fg = "base0" }
          "variable.other.member" = { fg = "blue500" }
          "variable.parameter" = { fg = "orange500" }
          "warning" =  { fg = "yellow500", modifiers= ["bold", "underlined"] }

          [palette]
          base04 = "#00141A"
          base03 = "#002d38"
          base02 = "#073541"
          base01 = "#586E74"
          base00 = "#647A82"
          base0 = "#9FABAD"
          base1 = "#ADB8B8"
          base2 = "#EDE7D4"
          base3 = "#FDF6E2"
          base4 = "#FFFFFF"

          yellow900 = "#332700"
          yellow700 = "#664D00"
          yellow500 = "#B58900"
          yellow300 = "#FFC100"
          yellow100 = "#FFE999"

          orange900 = "#5C220A"
          orange700 = "#A13C11"
          orange500 = "#CB4B16"
          orange300 = "#F8520E"
          orange100 = "#FF9468"

          red900 = "#57100F"
          red700 = "#B7211F"
          red500 = "#DC322F"
          red300 = "#F6524F"
          red100 = "#FF9D9B"

          magenta900 = "#541232"
          magenta700 = "#B02669"
          magenta500 = "#D33682"
          magenta300 = "#F255A1"
          magenta100 = "#FF77B9"

          violet900 = "#25285B"
          violet700 = "#494FB6"
          violet500 = "#6C71C4"
          violet300 = "#9CA0ED"
          violet100 = "#CCCFFF"

          blue900 = "#103956"
          blue700 = "#1B6497"
          blue500 = "#268BD2"
          blue300 = "#49AEF5"
          blue100 = "#AADCFF"

          cyan900 = "#103B3D"
          cyan700 = "#1A6265"
          cyan500 = "#2AA198"
          cyan300 = "#29EEDF"
          cyan100 = "#B9FFFA"

          green900 = "#2C3300"
          green700 = "#596600"
          green500 = "#859900"
          green300 = "#BAFB00"
          green100 = "#D6FFAC"
        '';

        ".config/helix/themes/gruber.toml".text = ''
          "attribute" = "fg0"
          "keyword" = { fg = "yellow0", modifiers = ["bold"] }
          "keyword.directive" = "quartz"
          "namespace" = "quartz"
          "punctuation" = "fg0"
          "punctuation.delimiter" = "fg0"
          "operator" = "fg0"
          "special" = { fg = "yellow0", modifiers = ["bold"] }
          "variable" = "fg0"
          "variable.builtin" = {  fg = "yellow0", modifiers = ["bold"] }
          "variable.parameter" = "fg0"
          "type" = "quartz"
          "type.builtin" = "yellow0"
          "constructor" = { fg = "quartz" }
          "function" = "niagara0"
          "function.builtin" = "yellow0"
          "tag" = "niagara0"
          "comment" = { fg = "brown0" }
          "constant.character" = { fg = "green0" }
          "constant.character.escape" = { fg = "yellow0" }
          "constant.builtin" = { fg = "yellow0", modifiers = ["bold"] }
          "string" = "green0"
          "constant.numeric" = "wisteria"
          "label" = "fg0"
          "module" = "aqua1"

          "diff.plus" = "green1"
          "diff.delta" = "orange1"
          "diff.minus" = "red0"

          "warning" = { fg = "orange1", modifiers = ["bold"] }
          "error" = { fg = "red0", modifiers = ["bold"] }
          "info" = { fg = "aqua1", modifiers = ["bold"] }
          "hint" = { fg = "blue0", modifiers = ["bold"] }

          "ui.background" = {}
          "ui.linenr" = { fg = "bg4" }
          "ui.linenr.selected" = { fg = "yellow0" }
          "ui.cursorline" = { bg = "bg1" }

          "ui.statusline" = { fg = "fg0", bg = "bg1" }
          "ui.statusline.normal" = { fg = "bg1", bg = "yellow0", modifiers = ["bold"] }
          "ui.statusline.insert" = { fg = "bg1", bg = "blue0", modifiers = ["bold"] }
          "ui.statusline.select" = { fg = "bg1", bg = "wisteria", modifiers = ["bold"] }
          "ui.statusline.inactive" = { fg = "fg3", bg = "bg1" }

          "ui.bufferline" = { fg = "fg3", bg = "bg6" }
          "ui.bufferline.active" = { fg = "fg0", bg = "bg7" }

          "ui.popup" = { bg = "bg6" }
          "ui.window" = { fg = "bg1" }
          "ui.help" = { bg = "bg1", fg = "fg0" }
          "ui.text" = { fg = "fg0" }
          "ui.text.directory" = { fg = "niagara0", modifiers = ["bold"] }
          "ui.text.focus" = { bg = "bg5", modifiers = ["bold"] }
          "ui.selection" = { bg = "bg2" }
          "ui.selection.primary" = { bg = "bg5" }
          "ui.cursor.primary" = { bg = "fg0", fg = "niagara1" }
          "ui.cursor.match" = { bg = "yellow1" }
          "ui.menu" = { fg = "fg0", bg = "bg6" }
          "ui.menu.selected" = { fg = "fg0", bg = "bg5", modifiers = ["bold"] }

          "ui.virtual.whitespace" = "bg8"
          "ui.virtual.indent-guide" = "bg8"
          "ui.virtual.ruler" = { bg = "bg1" }
          "ui.virtual.inlay-hint" = { fg = "bg7" }
          "ui.virtual.wrap" = { fg = "bg2" }
          "ui.virtual.jump-label" = { fg = "red3", modifiers = ["bold"] }

          "diagnostic.warning" = { underline = { color = "orange1", style = "dashed" } }
          "diagnostic.error" = { underline = { color = "red3", style = "dashed" } }
          "diagnostic.info" = { underline = { color = "aqua1", style = "dashed" } }
          "diagnostic.hint" = { underline = { color = "blue0", style = "dashed" } }
          "diagnostic.unnecessary" = { modifiers = ["dim"] }
          "diagnostic.deprecated" = { modifiers = ["crossed_out"] }

          "markup.heading" = { fg = "aqua1", modifiers = ["bold"] }
          "markup.bold" = { modifiers = ["bold"] }
          "markup.italic" = { modifiers = ["italic"] }
          "markup.strikethrough" = { modifiers = ["crossed_out"] }
          "markup.link.url" = { fg = "green1", modifiers = ["underlined"] }
          "markup.link.text" = "red3"
          "markup.raw" = { fg = "fg0", bg = "bg8", modifiers = ["bold"] }

          [palette]
          fg0 =      "#e4e4ef"
          fg1 =      "#f4f4ff"
          fg2 =      "#f5f5f5"
          fg3 =      "#a89984"
          bg0 =      "#181818"
          bg1 =      "#282828"
          bg2 =      "#453d41"
          bg4 =      "#52494e"
          bg5 =      "#404040"
          bg6 =      "#232323"
          bg7 =      "#3f3f3f"
          bg8 =      "#2c2c2c"
          red0 =     "#f43841"
          red1 =     "#ff4f58"
          red2 =     "#2B0A0B"
          red3 =     "#fb4934"
          green0 =   "#73c936"
          green1 =   "#b8bb26"
          yellow0 =  "#ffdd33"
          yellow1 =  "#655814"
          blue0 =    "#5292c8"
          orange0 =  "#d65d0e"
          orange1 =  "#fe8019"
          brown0 =   "#cc8c3c"
          quartz =   "#95a99f"
          niagara0 = "#96a6c8"
          niagara1 = "#303540"
          wisteria = "#9e95c7"
          aqua1 =    "#8ec07c"
        '';

        ".config/helix/themes/latte.toml".text = ''
          "attribute" = "yellow"

          "type" = "yellow"
          "type.enum.variant" = "teal"

          "constructor" = "sapphire"

          "constant" = "peach"
          "constant.character" = "teal"
          "constant.character.escape" = "pink"

          "string" = "green"
          "string.regexp" = "pink"
          "string.special" = "blue"
          "string.special.symbol" = "red"

          "comment" = { fg = "overlay2", modifiers = ["italic"] }

          "variable" = "text"
          "variable.parameter" = { fg = "maroon", modifiers = ["italic"] }
          "variable.builtin" = "red"
          "variable.other.member" = "blue"

          "label" = "sapphire" # used for lifetimes

          "punctuation" = "overlay2"
          "punctuation.special" = "sky"

          "keyword" = "mauve"
          "keyword.control.conditional" = { fg = "mauve", modifiers = ["italic"] }

          "operator" = "sky"

          "function" = "blue"
          "function.macro" = "rosewater"

          "tag" = "blue"

          "namespace" = { fg = "yellow", modifiers = ["italic"] }

          "special" = "blue" # fuzzy highlight

          "markup.heading.1" = "red"
          "markup.heading.2" = "peach"
          "markup.heading.3" = "yellow"
          "markup.heading.4" = "green"
          "markup.heading.5" = "sapphire"
          "markup.heading.6" = "lavender"
          "markup.list" = "teal"
          "markup.list.unchecked" = "overlay2"
          "markup.list.checked" = "green"
          "markup.bold" = { fg = "red", modifiers = ["bold"] }
          "markup.italic" = { fg = "red", modifiers = ["italic"] }
          "markup.link.url" = { fg = "blue", modifiers = ["italic", "underlined"] }
          "markup.link.text" = "lavender"
          "markup.link.label" = "sapphire"
          "markup.raw" = "green"
          "markup.quote" = "pink"

          "diff.plus" = "green"
          "diff.minus" = "red"
          "diff.delta" = "blue"

          "ui.background" = { fg = "text" }

          "ui.linenr" = { fg = "surface1" }
          "ui.linenr.selected" = { fg = "lavender" }

          "ui.statusline" = { fg = "subtext1", bg = "mantle" }
          "ui.statusline.inactive" = { fg = "surface2", bg = "mantle" }
          "ui.statusline.normal" = { fg = "base", bg = "rosewater", modifiers = ["bold"] }
          "ui.statusline.insert" = { fg = "base", bg = "green", modifiers = ["bold"]  }
          "ui.statusline.select" = { fg = "base", bg = "lavender", modifiers = ["bold"]  }

          "ui.popup" = { fg = "text", bg = "surface0" }
          "ui.window" = { fg = "crust" }
          "ui.help" = { fg = "overlay2", bg = "surface0" }

          "ui.bufferline" = { fg = "subtext0", bg = "mantle" }
          "ui.bufferline.active" = { fg = "mauve", bg = "base", underline = { color = "mauve", style = "line" } }
          "ui.bufferline.background" = { bg = "crust" }

          "ui.text" = "text"
          "ui.text.focus" = { fg = "text", bg = "surface0", modifiers = ["bold"] }
          "ui.text.inactive" = { fg = "overlay1" }
          "ui.text.directory" = { fg = "blue" }

          "ui.virtual" = "overlay0"
          "ui.virtual.ruler" = { bg = "surface0" }
          "ui.virtual.indent-guide" = "surface0"
          "ui.virtual.inlay-hint" = { fg = "surface1", bg = "mantle" }
          "ui.virtual.jump-label" = { fg = "rosewater", modifiers = ["bold"] }

          "ui.selection" = { bg = "surface1" }

          "ui.cursor" = { fg = "base", bg = "secondary_cursor" }
          "ui.cursor.primary" = { fg = "base", bg = "rosewater" }
          "ui.cursor.match" = { fg = "peach", modifiers = ["bold"] }

          "ui.cursor.primary.normal" = { fg = "base", bg = "rosewater" }
          "ui.cursor.primary.insert" = { fg = "base", bg = "green" }
          "ui.cursor.primary.select" = { fg = "base", bg = "lavender" }

          "ui.cursor.normal" = { fg = "base", bg = "secondary_cursor_normal" }
          "ui.cursor.insert" = { fg = "base", bg = "secondary_cursor_insert" }
          "ui.cursor.select" = { fg = "base", bg = "secondary_cursor_select" }

          "ui.cursorline.primary" = { bg = "cursorline" }

          "ui.highlight" = { bg = "surface1", modifiers = ["bold"] }

          "ui.menu" = { fg = "overlay2", bg = "surface0" }
          "ui.menu.selected" = { fg = "text", bg = "surface1", modifiers = ["bold"] }

          "diagnostic.error" = { underline = { color = "red", style = "curl" } }
          "diagnostic.warning" = { underline = { color = "yellow", style = "curl" } }
          "diagnostic.info" = { underline = { color = "sky", style = "curl" } }
          "diagnostic.hint" = { underline = { color = "teal", style = "curl" } }
          "diagnostic.unnecessary" = { modifiers = ["dim"] }

          error = "red"
          warning = "yellow"
          info = "sky"
          hint = "teal"

          [palette]
          rosewater = "#dc8a78"
          flamingo = "#dd7878"
          pink = "#ea76cb"
          mauve = "#8839ef"
          red = "#d20f39"
          maroon = "#e64553"
          peach = "#fe640b"
          yellow = "#df8e1d"
          green = "#40a02b"
          teal = "#179299"
          sky = "#04a5e5"
          sapphire = "#209fb5"
          blue = "#1e66f5"
          lavender = "#7287fd"
          text = "#4c4f69"
          subtext1 = "#5c5f77"
          subtext0 = "#6c6f85"
          overlay2 = "#7c7f93"
          overlay1 = "#8c8fa1"
          overlay0 = "#9ca0b0"
          surface2 = "#acb0be"
          surface1 = "#bcc0cc"
          surface0 = "#ccd0da"
          base = "#eff1f5"
          mantle = "#e6e9ef"
          crust = "#dce0e8"

          cursorline = "#e8ecf1"
          secondary_cursor = "#e1a99d"
          secondary_cursor_select = "#97a7fb"
          secondary_cursor_normal = "#e1a99d"
          secondary_cursor_insert = "#74b867"
        '';
      };
    }
  ];
}
