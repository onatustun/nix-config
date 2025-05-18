{
  config,
  ...
}: {
   home.file.".config/helix/themes/stylix.toml" = {
    text = ''
      "attribute" = "${config.stylix.base16Scheme.base09}"
      "comment" = { fg = "${config.stylix.base16Scheme.base03}", modifiers = ["italic"] }
      "constant" = "${config.stylix.base16Scheme.base09}"
      "constant.character.escape" = "${config.stylix.base16Scheme.base0C}"
      "constant.numeric" = "${config.stylix.base16Scheme.base09}"
      "constructor" = "${config.stylix.base16Scheme.base0D}"
      "debug" = "${config.stylix.base16Scheme.base03}"
      "diagnostic" = { modifiers = ["underlined"] }
      "diff.delta" = "${config.stylix.base16Scheme.base09}"
      "diff.minus" = "${config.stylix.base16Scheme.base08}"
      "diff.plus" = "${config.stylix.base16Scheme.base0B}"
      "error" = "${config.stylix.base16Scheme.base08}"
      "function" = "${config.stylix.base16Scheme.base0D}"
      "hint" = "${config.stylix.base16Scheme.base03}"
      "info" = "${config.stylix.base16Scheme.base0D}"
      "keyword" = "${config.stylix.base16Scheme.base0E}"
      "label" = "${config.stylix.base16Scheme.base0E}"
      "namespace" = "${config.stylix.base16Scheme.base0E}"
      "operator" = "${config.stylix.base16Scheme.base05}"
      "special" = "${config.stylix.base16Scheme.base0D}"
      "string"  = "${config.stylix.base16Scheme.base0B}"
      "type" = "${config.stylix.base16Scheme.base0A}"
      "variable" = "${config.stylix.base16Scheme.base08}"
      "variable.other.member" = "${config.stylix.base16Scheme.base0B}"
      "warning" = "${config.stylix.base16Scheme.base09}"

      "markup.bold" = { fg = "${config.stylix.base16Scheme.base0A}", modifiers = ["bold"] }
      "markup.heading.1" = { fg = "${config.stylix.base16Scheme.base0D}", modifiers = ["bold"] }
      "markup.heading.2" = { fg = "${config.stylix.base16Scheme.base08}", modifiers = ["bold"] }
      "markup.heading.3" = { fg = "${config.stylix.base16Scheme.base09}", modifiers = ["bold"] }
      "markup.heading.4" = { fg = "${config.stylix.base16Scheme.base0A}", modifiers = ["bold"] }
      "markup.heading.5" = { fg = "${config.stylix.base16Scheme.base0B}", modifiers = ["bold"] }
      "markup.heading.6" = { fg = "${config.stylix.base16Scheme.base0C}", modifiers = ["bold"] }
      "markup.italic" = { fg = "${config.stylix.base16Scheme.base0E}", modifiers = ["italic"] }
      "markup.link.text" = "${config.stylix.base16Scheme.base08}"
      "markup.link.url" = { fg = "${config.stylix.base16Scheme.base09}", modifiers = ["underlined"] }
      "markup.list" = "${config.stylix.base16Scheme.base08}"
      "markup.quote" = "${config.stylix.base16Scheme.base0C}"
      "markup.raw" = "${config.stylix.base16Scheme.base0B}"
      "markup.strikethrough" = { modifiers = ["crossed_out"] }

      "diagnostic.hint" = { underline = { style = "curl" } }
      "diagnostic.info" = { underline = { style = "curl" } }
      "diagnostic.warning" = { underline = { style = "curl" } }
      "diagnostic.error" = { underline = { style = "curl" } }

      "ui.background" = { bg = "${config.stylix.base16Scheme.base00}" }
      "ui.bufferline.active" = { fg = "${config.stylix.base16Scheme.base00}", bg = "${config.stylix.base16Scheme.base03}", modifiers = ["bold"] }
      "ui.bufferline" = { fg = "${config.stylix.base16Scheme.base04}", bg = "${config.stylix.base16Scheme.base00}" }
      "ui.cursor" = { fg = "${config.stylix.base16Scheme.base05}", modifiers = ["reversed"] }
      "ui.cursor.insert" = { fg = "${config.stylix.base16Scheme.base05}", modifiers = ["reversed"] }
      "ui.cursorline.primary" = { fg = "${config.stylix.base16Scheme.base05}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.cursor.match" = { fg = "${config.stylix.base16Scheme.base05}", bg = "${config.stylix.base16Scheme.base02}", modifiers = ["bold"] }
      "ui.cursor.select" = { fg = "${config.stylix.base16Scheme.base05}", modifiers = ["reversed"] }
      "ui.gutter" = { bg = "${config.stylix.base16Scheme.base00}" }
      "ui.help" = { fg = "${config.stylix.base16Scheme.base06}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.linenr" = { fg = "${config.stylix.base16Scheme.base03}", bg = "${config.stylix.base16Scheme.base00}" }
      "ui.linenr.selected" = { fg = "${config.stylix.base16Scheme.base04}", bg = "${config.stylix.base16Scheme.base01}", modifiers = ["bold"] }
      "ui.menu" = { fg = "${config.stylix.base16Scheme.base05}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.menu.scroll" = { fg = "${config.stylix.base16Scheme.base03}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.menu.selected" = { fg = "${config.stylix.base16Scheme.base01}", bg = "${config.stylix.base16Scheme.base04}" }
      "ui.popup" = { bg = "${config.stylix.base16Scheme.base01}" }
      "ui.selection" = { bg = "${config.stylix.base16Scheme.base02}" }
      "ui.selection.primary" = { bg = "${config.stylix.base16Scheme.base02}" }
      "ui.statusline" = { fg = "${config.stylix.base16Scheme.base04}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.statusline.inactive" = { bg = "${config.stylix.base16Scheme.base01}", fg = "${config.stylix.base16Scheme.base03}" }
      "ui.statusline.insert" = { fg = "${config.stylix.base16Scheme.base00}", bg = "${config.stylix.base16Scheme.base0B}" }
      "ui.statusline.normal" = { fg = "${config.stylix.base16Scheme.base00}", bg = "${config.stylix.base16Scheme.base03}" }
      "ui.statusline.select" = { fg = "${config.stylix.base16Scheme.base00}", bg = "${config.stylix.base16Scheme.base0F}" }
      "ui.text" = "${config.stylix.base16Scheme.base05}"
      "ui.text.directory" = "${config.stylix.base16Scheme.base0D}"
      "ui.text.focus" = "${config.stylix.base16Scheme.base05}"
      "ui.virtual.indent-guide" = { fg = "${config.stylix.base16Scheme.base03}" }
      "ui.virtual.inlay-hint" = { fg = "${config.stylix.base16Scheme.base03}" }
      "ui.virtual.ruler" = { bg = "${config.stylix.base16Scheme.base01}" }
      "ui.virtual.jump-label" = { fg = "${config.stylix.base16Scheme.base0A}", modifiers = ["bold"] }
      "ui.window" = { bg = "${config.stylix.base16Scheme.base01}" }
    '';
  };


  home.file.".config/helix/themes/solarized.toml" = {
    text = ''
      "attribute" = { fg = "violet" }
      "keyword" = { fg = "green" }
      "keyword.directive" = { fg = "orange" }
      "namespace" = { fg = "violet" }
      "operator" = { fg = "green" }
      "special" = { fg = "orange" }
      "variable.builtin" = { fg = "cyan", modifiers = ["bold"] }
      "variable.function" = { fg = "blue" }
      "type" = { fg = "yellow" }
      "type.builtin" = { fg = "yellow", modifiers = ["bold"] }
      "constructor" = { fg = "blue" }
      "function" = { fg = "blue" }
      "function.macro" = { fg = "magenta" }
      "function.builtin" = { fg = "blue", modifiers = ["bold"] }
      "function.special" = { fg = "magenta" }
      "comment" = { fg = "base01" }
      "string" = { fg = "cyan" }
      "constant" = { fg = "cyan" }
      "constant.builtin" = { fg = "cyan", modifiers = ["bold"] }
      "constant.character.escape" = { fg = "red", modifiers = ["bold"] }
      "label" = { fg = "green" }
      "module" = { fg = "violet" }
      "tag" = { fg = "magenta" }

      "markup.heading" = "blue"
      "markup.list" = "red"
      "markup.bold" = { fg = "yellow", modifiers = ["bold"] }
      "markup.italic" = { fg = "magenta", modifiers = ["italic"] }
      "markup.strikethrough" = { modifiers = ["crossed_out"] }
      "markup.link.url" = { fg = "yellow", modifiers = ["underlined"] }
      "markup.link.text" = "red"
      "markup.quote" = "cyan"
      "markup.raw" = "green"

      "diff.plus" = { fg = "green" }
      "diff.delta" = { fg = "yellow" }
      "diff.minus" = { fg = "red" }

      "ui.background" = { bg = "base03" }

      "ui.virtual.whitespace" = { fg = "base01" }
      "ui.virtual.inlay-hint" = { fg = "base01", modifiers = ["italic"] }
      "ui.virtual.jump-label" = { fg = "red", modifiers = ["bold"] }

      "ui.linenr" = { fg = "base0", bg = "base02" }
      "ui.linenr.selected" = { fg = "blue", modifiers = ["bold"] }
      "ui.cursorline" = { bg = "base03" }

      "ui.statusline" = { fg = "base03", bg = "base0" }
      "ui.statusline.normal" = { bg = "blue" }
      "ui.statusline.insert" = { bg = "green" }
      "ui.statusline.select" = { bg = "yellow" }

      "ui.statusline.inactive" = { fg = "base1", bg = "base01" }

      "ui.popup" = { bg = "base02" }
      "ui.menu.selected" = { fg = "base02", bg = "base2"}
      "ui.menu" = { fg = "base0", bg = "base02" }
      "ui.window" = { fg = "base3" }
      "ui.help" = { modifiers = ["reversed"] }

      "ui.popup.info" = {fg = "base02", bg = "base1", modifiers = ["bold"]}
      "ui.text.info" = {fg = "base02", modifiers = ["bold"]}

      "ui.text" = { fg = "base1" }
      "ui.text.focus" = { fg = "blue", modifiers = ["bold"]}

      "ui.cursor.primary" = { fg = "base03", bg = "base1" }
      "ui.cursor.select" = { fg = "base02", bg = "cyan" }
      "ui.cursorline.primary" = { bg = "base02" }
      "ui.cursorline.secondary" = { bg = "base025" }

      "ui.selection" = { bg = "base0175" }
      "ui.selection.primary" = { bg = "base015" }

      "ui.virtual.indent-guide" = { fg = "base02" }
      "ui.virtual.ruler" = { bg = "base02" }

      "ui.cursor" = {fg = "base02", bg = "cyan"}
      "ui.cursor.insert" = {fg = "base03", bg = "base3"}
      "ui.cursor.match" = { fg = "base03", bg = "base00" }

      "warning" =  { fg = "orange", modifiers= ["bold", "underlined"] }
      "error" = { fg = "red", modifiers= ["bold", "underlined"] }
      "info" = { fg = "blue", modifiers= ["bold", "underlined"] }
      "hint" = { fg = "base01", modifiers= ["bold", "underlined"] }

      "diagnostic.warning" = { underline = { style = "curl", color = "orange" } }
      "diagnostic.error" = { underline = { style = "curl", color = "red" } }
      "diagnostic.info" = { underline = { style = "curl", color = "blue" } }
      "diagnostic.hint" = { underline = { style = "curl", color = "base01" } }
      "diagnostic.unnecessary" = { modifiers = ["dim"] }
      "diagnostic.deprecated" = { modifiers = ["crossed_out"] }

      [palette]
      base03   = "#002b36"
      base025  = "#03303b"
      base02   = "#073642"
      base0175 = "#16404b"
      base015  = "#2c4f59"
      base01   = "#586e75"
      base00   = "#657b83"
      base0    = "#839496"
      base1    = "#93a1a1"
      base2    = "#eee8d5"
      base3    = "#fdf6e3"

      yellow  = "#b58900"
      orange  = "#cb4b16"
      red     = "#dc322f"
      magenta = "#d33682"
      violet  = "#6c71c4"
      blue    = "#268bd2"
      cyan    = "#2aa198"
      green   = "#859900"
    '';
  };


  home.file.".config/helix/themes/solarized-osaka.toml" = {
    text = ''
      "attribute" = { fg = "blue300" }
      "keyword" = { fg = "green500" }
      "keyword.directive" = { fg = "red500" }
      "keyword.storage.modifier" = { fg = "green500" }
      "keyword.storage.type" = { fg = "green500" }
      "keyword.control.import" = { fg = "green500" }
      "keyword.function" = { fg = "green500" }
      "namespace" = { fg = "violet300" }
      "operator" = { fg = "green500" }
      # Special also affects typed chars in file finder
      "special" = { fg = "orange500" }
      "variable" = { fg = "base0" }
      "variable.builtin" = { fg = "orange500" }
      "variable.parameter" = { fg = "orange500" }
      "type" = { fg = "yellow300" }
      "type.builtin" = { fg = "yellow300", modifiers = ["bold"] }
      "constructor" = { fg = "orange500" }
      "function" = { fg = "blue500" }
      "function.macro" = { fg = "magenta900" }
      "function.builtin" = { fg = "blue900", modifiers = ["bold"] }
      "function.special" = { fg = "magenta900" }
      "comment" = { fg = "base01" }
      "string" = { fg = "cyan500" }
      "constant" = { fg = "cyan500" }
      "constant.builtin" = { fg = "cyan500", modifiers = ["bold"] }
      "constant.character" = { fg = "cyan500" }
      "constant.character.escape" = { fg = "red900", modifiers = ["bold"] }
      "label" = { fg = "green500" }
      "module" = { fg = "violet900" }
      "tag" = { fg = "green500" }
      "punctuation" = { fg = "orange500" }
      "punctuation.delimiter" = { fg = "green500" }
      "punctuation.bracket" = { fg = "orange500" }
      "punctuation.special" = { fg = "orange500" }
      "variable.other.member" = { fg = "blue500" }

      # TODO
      "markup.heading" = "green300"
      "markup.list" = "red300"
      "markup.bold" = { fg = "yellow500", modifiers = ["bold"] }
      "markup.italic" = { fg = "magentac300", modifiers = ["italic"] }
      "markup.strikethrough" = { modifiers = ["crossed_out"] }
      "markup.link.url" = { fg = "yellow300", modifiers = ["underlined"] }
      "markup.link.text" = "blue300"
      "markup.quote" = "cyan300"
      "markup.raw" = "green300"

      "diff.plus" = { fg = "green900" }
      "diff.delta" = { fg = "orange900" }
      "diff.minus" = { fg = "red900" }

      "ui.background" = { bg = "bg" }

      "ui.virtual.whitespace" = { fg = "base01" }
      "ui.virtual.inlay-hint" = { fg = "base01", modifiers = ["italic"] }

      # Line Numbers
      "ui.linenr" = { fg = "base01" }
      "ui.linenr.selected" = { fg = "yellow500", modifiers = ["bold"] }
      "ui.gutter.selected" = { bg = "base02" }
      "ui.cursorline" = { bg = "base04" }

      "ui.statusline" = { fg = "base1", bg = "base03" }
      "ui.statusline.inactive" = { fg = "base0", bg = "base04" }
      "ui.statusline.normal" = { fg = "base03", bg = "blue500", modifiers = ["bold"]}
      "ui.statusline.insert" = { fg = "base04", bg = "green500", modifiers = ["bold"]}
      "ui.statusline.select" = { fg = "base04", bg = "yellow500", modifiers = ["bold"]}
      "ui.statusline.seperator" = { bg = "yellow500" }

      "ui.popup" = { fg = "base1", bg = "base02" }
      "ui.menu.selected" = { fg = "base02", bg = "base2"}
      "ui.menu" = { fg = "base0", bg = "base03" }
      "ui.window" = { fg = "base3" }
      "ui.help" = { modifiers = ["reversed"] }

      "ui.popup.info" = {fg = "base02", bg = "base04", modifiers = ["bold"]}

      "ui.text" = { fg = "base1" }
      "ui.text.focus" = { fg = "blue300", modifiers = ["bold"]}
      "ui.text.inactive" = { fg = "base01" }
      "ui.text.info" = { fg = "base2" }
      "ui.highlight" = { fg = "yellow100" }

      "ui.cursor.primary" = { fg = "base04", bg = "base1" }
      "ui.cursor.select" = { fg = "base02", bg = "cyan900" }
      "ui.cursorline.primary" = { bg = "base02" }
      "ui.cursorline.secondary" = { bg = "base03" }

      "ui.selection" = { bg = "base02" }
      "ui.selection.primary" = { bg = "base01" }

      "ui.virtual.indent-guide" = { fg = "base02" }
      "ui.virtual.ruler" = { fg = "red900" }

      "ui.cursor" = {fg = "base02", bg = "cyan900"}
      "ui.cursor.insert" = {fg = "base04", bg = "base3"}
      "ui.cursor.match" = { fg = "base04", bg = "base00" }

      "warning" =  { fg = "yellow500", modifiers= ["bold", "underlined"] }
      "error" = { fg = "red500", modifiers= ["bold", "underlined"] }
      "info" = { fg = "blue500", modifiers= ["bold", "underlined"] }
      "hint" = { fg = "cyan500", modifiers= ["bold", "underlined"] }

      "diagnostic.warning" = { fg = "yellow500", bg = "yellow900", underline = { style = "curl", color = "yellow900" } }
      "diagnostic.error" = { fg = "red500", bg = "red900",underline = { style = "curl", color = "red900" } }
      "diagnostic.info" = { fg = "blue500", bg = "blue900", underline = { style = "curl", color = "blue900" } }
      "diagnostic.hint" = { fg = "cyan500", bg = "cyan900", underline = { style = "curl", color = "cyan900" } }

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

      bg = "#00141A"
    '';
  };
}
